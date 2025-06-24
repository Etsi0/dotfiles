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
import "root:/widgets/Styles" as Styles

Island {
	id: root
	readonly property var duration: {
		'width': 300,
		'color': 150
	}
	readonly property int focusId: Hyprland.focusedWorkspace?.id
	readonly property real btnGap: (Variables.height - this.btnSize) / 2
	readonly property int btnSize: 20

	anchors {
		top: parent.top
		left: parent.left
	}

	implicitWidth: row.width + this.btnGap * 2

	Behavior on width {
		NumberAnimation {
			duration: root.duration.width
			easing.type: Easing.OutCubic
		}
	}

	Row {
		id: row
		anchors.centerIn: parent
		spacing: root.btnGap

		Repeater {
			model: 10

			Rectangle {
				id: btn
				required property int index
				property int i: index + 1
				property bool isHovered: false

				width: (root.focusId == this.i) ? root.btnSize * 2 + root.btnGap : root.btnSize
				height: root.btnSize
				radius: Variables.radius - root.btnGap
				color: Opacity.fn(root.focusId === this.i ? Theme[Variables.activeTheme].secondary : Theme[Variables.activeTheme].primary, isHovered ? 0.75 : 1.0)

				Behavior on width {
					NumberAnimation {
						duration: root.duration.width
						easing.type: Easing.OutCubic
					}
				}

				Behavior on color {
					ColorAnimation {
						duration: root.duration.color
						easing.type: Easing.OutCubic
					}
				}

				MouseArea {
					anchors.fill: parent
					hoverEnabled: true
					cursorShape: {
						if (root.focusId !== btn.i) {
							Qt.PointingHandCursor;
						}
					}
					onClicked: {
						if (root.focusId !== btn.i) {
							isHovered = false;
							Hyprland.dispatch("workspace " + (btn.i));
						}
					}
					onEntered: {
						if (root.focusId !== btn.i) {
							isHovered = true;
						}
					}
					onExited: {
						if (root.focusId !== btn.i) {
							isHovered = false;
						}
					}
				}
			}
		}
	}
}