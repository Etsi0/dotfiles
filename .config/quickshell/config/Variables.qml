pragma Singleton
import Quickshell
import "root:/themes/" as Theme

Singleton {
	readonly property var theme: Theme[this.activeTheme]
	readonly property string activeTheme: 'Mac'
	property string activeWindow: ''
	readonly property int fontSize: 20
	readonly property string fontFamily: 'JetbrainsMono Nerd Font'
	readonly property int height: 35
	readonly property string iconFolder: 'root:/assets/'
	readonly property bool isBatteryVisible: true
	readonly property bool isBluetoothVisible: true
	readonly property bool isClockVisible: true
	readonly property bool isDateVisible: true
	readonly property bool isNetworkVisible: true
	readonly property bool isVolumeVisible: true
	readonly property bool isWorkspacesVisible: true
	readonly property int radius: 12
	readonly property int refreshRate: 1000 // 1min
}