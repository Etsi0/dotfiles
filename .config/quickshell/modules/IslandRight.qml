import QtQuick
import "root:/config/"
import "root:/themes/" as Theme
import "root:/scripts/"
import "root:/utils/"
import "root:/widgets/"
import "root:/widgets/Btn" as Btn
import "root:/widgets/Styles" as Styles

Island {
	id: root

	anchors {
		top: parent.top
		right: parent.right
	}

	implicitWidth: row.implicitWidth + (Variables.height - Variables.fontSize)

	Row {
		id: row
		anchors {
			right: parent.right
			verticalCenter: parent.verticalCenter
			rightMargin: (Variables.height - Variables.fontSize) / 2
		}

		spacing: 1

		Loader { active: Variables.isVolumeVisible; sourceComponent: Btn.Audio {} }
		Loader { active: Variables.isBluetoothVisible; sourceComponent: Btn.Bluetooth {} }
		Loader { active: Variables.isNetworkVisible; sourceComponent: Btn.Network {} }
		Loader { active: Variables.isBatteryVisible; sourceComponent: Btn.Battery {} }
		Loader { active: Variables.isClockVisible || Variables.isDateVisible; sourceComponent: Btn.TimeAndDate {} }
	}
}