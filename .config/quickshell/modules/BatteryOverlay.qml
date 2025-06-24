import QtQuick
import Quickshell
import Quickshell.Services.UPower
import "root:/config/"
import "root:/scripts/" as Script
import "root:/utils/"

PanelWindow {
	id: batteryWarning

	anchors {
		top: true
		left: true
	}

	margins {
		top: 6
		left: 6
	}

	mask: Region {} // makes this area non clickable

	implicitHeight: screen.height - root.height - 6 * 3
	implicitWidth: screen.width - 6 * 2
	color: "transparent"

	Rectangle {
		readonly property var colorConfig: Script.Battery.isCharging && Script.Battery.percentage >= 80
			? { color: "#0f0", bgO: 0.03125, borderO: 1.0 }
			: !Script.Battery.isCharging && Script.Battery.percentage <= 20
				? { color: "#f00", bgO: 0.03125, borderO: 1.0 }
				: { color: "#000", bgO: 0.0, borderO: 0.0 }

		anchors {
			top: parent.top
			left: parent.left
			right: parent.right
			bottom: parent.bottom
		}

		color: Opacity.fn(colorConfig.color, colorConfig.bgO)
		border.width: 2
		border.color: Opacity.fn(colorConfig.color, colorConfig.borderO)
		radius: Variables.radius
	}
}