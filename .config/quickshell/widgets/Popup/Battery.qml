import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "root:/config/"
import "root:/themes/" as Theme
import "root:/scripts/"
import "root:/utils/"
import "root:/widgets"
import "root:/widgets/Styles" as Style

ColumnLayout {
	id: root
	implicitWidth: popupRoot.width - 7.5 * 2
	spacing: 7.5

	Row {
		spacing: 7.5

		Style.Btn {
			active: true
			hoverEnabled: false
			height: this.width / (32/10)
			implicitWidth: (root.width - parent.spacing*2) / 3
			radius: Variables.radius / 2
		}

		Style.Btn {
			active: true
			hoverEnabled: false
			height: this.width / (32/10)
			implicitWidth: (root.width - parent.spacing*2) / 3
			radius: Variables.radius / 2
		}

		Style.Btn {
			active: true
			hoverEnabled: false
			height: this.width / (32/10)
			implicitWidth: (root.width - parent.spacing*2) / 3
			radius: Variables.radius / 2
		}
	}

	Row {
		spacing: 7.5

		Rectangle {
			id: cpu
			property int percentage: 0
			height: this.width
			implicitWidth: (root.width - parent.spacing*2) / 3
			color: 'transparent'
			radius: Variables.radius / 2

			Style.Text {
				anchors {
					horizontalCenter: parent.horizontalCenter
					verticalCenter: parent.verticalCenter
				}
				text: 'CPU'
			}

			CircularProgressBar {
				degree: SystemUsage.cpuPerc * 100
			}
		}

		Rectangle {
			height: this.width
			implicitWidth: (root.width - parent.spacing*2) / 3
			color: 'transparent'
			radius: Variables.radius / 2

			Style.Text {
				anchors {
					horizontalCenter: parent.horizontalCenter
					verticalCenter: parent.verticalCenter
				}
				text: 'RAM'
			}

			CircularProgressBar {
				degree: SystemUsage.memPerc * 100
			}
		}

		Rectangle {
			id: gpu
			property int percentage: 0
			height: this.width
			implicitWidth: (root.width - parent.spacing*2) / 3
			color: 'transparent'
			radius: Variables.radius / 2

			Style.Text {
				anchors {
					horizontalCenter: parent.horizontalCenter
					verticalCenter: parent.verticalCenter
				}
				text: 'GPU'
			}

			CircularProgressBar {
				degree: SystemUsage.gpuPerc * 100
			}
		}
	}

	RowLayout {
		Style.Text {
			text: slider.tooltipContent.padStart(4, " ")
		}

		Style.Slider {
			id: slider
			value: 0.5;
		}

		Style.Text {
			text: slider.tooltipContent.padStart(4, " ")
		}
	}
}