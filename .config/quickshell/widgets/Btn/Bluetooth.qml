import QtQuick
import "root:/config/"
import "root:/scripts/" as Script
import "root:/widgets/"
import "root:/widgets/Styles" as Styles

Styles.Btn {
	id: root
	onClicked: () => {
		if(Variables.activeWindow !== 'Bluetooth') {
			Variables.activeWindow = '';
			Variables.activeWindow = 'Bluetooth';
		} else {
			Variables.activeWindow = '';
		}
	}

	Icon {
		id: icon
		iconName: Script.Bluetooth.bluetoothConnected
			? "materialDesignIcons/bluetooth/bluetooth_connected"
			: Script.Bluetooth.bluetoothEnabled
				? "materialDesignIcons/bluetooth/bluetooth"
				: "materialDesignIcons/bluetooth/bluetooth_disabled"
	}

	/*
	Process {
		id: toggleBluetooth
		command: ["bash", "-c", `bluetoothctl power ${Script.Bluetooth.bluetoothEnabled ? "off" : "on"}`]
		onRunningChanged: {
			if(!running) {
				Script.Bluetooth.update()
			}
		}
	}

	MouseArea {
		anchors.fill: root
		cursorShape: Qt.PointingHandCursor
		onClicked: {
			toggleBluetooth.running = true
		}
	}
	*/
}