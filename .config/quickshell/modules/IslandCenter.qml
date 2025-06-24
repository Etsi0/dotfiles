import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.UPower
import Quickshell.Io
import QtQuick
import "root:/components/"
import "root:/config/"
import "root:/themes/" as Theme
import "root:/utils/"
import "root:/widgets/"

Island {
	id: root
	property int hoverWidth: 0

	anchors {
		top: parent.top
		horizontalCenter: parent.horizontalCenter
	}

	implicitWidth: Variables.height * 32 / 10 + this.hoverWidth

	radius: 12
	color: Opacity.fn(Theme[Variables.activeTheme].background, 0.75)

	Behavior on implicitWidth {
		NumberAnimation {
			duration: 150
			easing.type: Easing.OutCubic
		}
	}

	MouseArea {
		anchors.fill: parent
		hoverEnabled: true
		onEntered: parent.hoverWidth = 6
		onExited: parent.hoverWidth = 0
	}
}