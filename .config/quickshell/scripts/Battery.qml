import QtQuick
import Quickshell
import Quickshell.Services.UPower
import "root:/utils/"
pragma Singleton

Singleton {
    id: root
    readonly property int percentage: Math.round(UPower.displayDevice.percentage * 100)
	readonly property bool isCharging: [UPowerDevice.Charging, UPowerDevice.FullyCharged].includes(UPower.displayDevice.state)
}