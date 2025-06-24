import Quickshell
import Quickshell.Io
import QtQuick
import "root:/config/"
import "root:/scripts/"
import "root:/utils/"
pragma Singleton

Singleton {
    id: root

    property string networkName: ""
    property int networkStrength: 0
    property string networkType: "none"

    Process {
        id: updateNetworkName
        command: ["sh", "-c", "nmcli -t -f NAME c show --active | head -1"]
        running: true
        stdout: SplitParser {
            onRead: data => {
                root.networkName = data || ""
            }
        }
    }

    Process {
        id: updateNetworkStrength
        running: true
        command: ["sh", "-c", "nmcli -f IN-USE,SIGNAL,SSID device wifi list | awk '/^\*/{print $2}'"]
        stdout: SplitParser {
            onRead: data => {
                root.networkStrength = Clamp.fn(0, parseInt(data) || 0, 100);
            }
        }
    }

    Process {
        id: updateNetworkType
        running: true
        command: ["sh", "-c", "nmcli device | awk '$3==\"connected\" {print $2}' | head -1"]
        stdout: SplitParser {
            onRead: data => {
                const type = data.trim().toLowerCase()
                root.networkType = ['ethernet', 'wifi'].includes(type) ? type : 'none'
            }
        }
    }
}