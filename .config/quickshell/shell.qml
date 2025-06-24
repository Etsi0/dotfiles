import QtQuick
import Quickshell
import Quickshell.Wayland
import "root:/modules/"
import "root:/config/"
import "root:/utils/"
import "root:/widgets/"

ShellRoot {
	Variants {
		model: Quickshell.screens

		Scope {
			PanelWindow {
				id: root

				anchors {
					top: true
					left: true
					right: true
				}

				margins {
					top: 6
					left: 6
					right: 6
				}

				implicitHeight: Variables.height
				exclusiveZone: Variables.height
				color: 'transparent'
				WlrLayershell.namespace: "quickshell:taskbar:blur"

				IslandLeft {}
				IslandCenter {}
				IslandRight {
					id: islandRight
				}
			}

			PanelWindow {
				id: popup

				anchors {
					top: true
					right: true
				}

				margins {
					top: 6
					right: 6
				}

				implicitWidth: islandRight.width
				implicitHeight: popupRoot.height
				exclusiveZone: popupRoot.height
				color: "transparent"
				WlrLayershell.namespace: "quickshell:popup:blur"

				Island {
					id: popupRoot
					readonly property real margin: 7.5

					implicitWidth: popup.width
					implicitHeight: childrenRect.height

					Item {
						x: popupRoot.margin
						y: popupRoot.margin
						implicitHeight: Variables.activeWindow ? childrenRect.height + popupRoot.margin * 2 : 0

						Repeater {
							model: ['Audio', 'Bluetooth', 'Network', 'Battery', 'TimeAndDate']
							Loader {
								active: Variables.activeWindow === modelData
								height: this.active ? this.implicitHeight : 0
								sourceComponent: Qt.createComponent(`root:/widgets/Popup/${modelData}.qml`)
							}
						}
					}
				}
			}

			Loader { active: true; sourceComponent: BatteryOverlay {} }
		}
	}
}