import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import Quickshell.Widgets
import "root:/config/"
import "root:/themes/" as Theme
import "root:/utils/"
import "root:/widgets/Styles" as Style

Slider {
    id: slider
    readonly property real trackHeight: Variables.height
    readonly property color highlightedTrackColor: Opacity.fn(Variables.theme.secondary, 0.95)
    readonly property color trackColor: Opacity.fn("#808080", 0.25)
    readonly property real margin: 6
	readonly property string tooltipContent: `${Math.round(value * 100)}%`
    Layout.fillWidth: true
    from: 0
    to: 1

    Behavior on value { // This makes the adjusted value (like volume) shift smoothly
        SmoothedAnimation {
            velocity: 850
        }
    }

    MouseArea {
        anchors.fill: parent
        onPressed: (mouse) => mouse.accepted = false
        cursorShape: slider.pressed ? Qt.ClosedHandCursor : Qt.PointingHandCursor
    }

    background: Item {
		id: bg
		anchors.verticalCenter: slider.verticalCenter
        height: handle.width ? slider.trackHeight * 0.225 : slider.trackHeight

		layer.enabled: true
		layer.effect: OpacityMask {
			maskSource: Rectangle {
				width: bg.width
				height: bg.height
				radius: bg.height / 2
			}
		}

        Rectangle {
			id: highlight
            anchors.verticalCenter: bg.verticalCenter
            anchors.left: bg.left

            width: handle.x - slider.margin
            height: bg.height
            color: slider.highlightedTrackColor
        }

		Rectangle {
			id: track
            anchors.verticalCenter: bg.verticalCenter
            anchors.right: bg.right

            width: slider.availableWidth - handle.x - slider.margin - handle.width
            height: bg.height
            color: slider.trackColor
        }
    }

    handle: Rectangle {
        id: handle
		x: Clamp.fn(0, slider.visualPosition * slider.availableWidth - handle.width / 2, slider.availableWidth - handle.width)
        implicitWidth: slider.pressed ? 4 : 6
        implicitHeight: slider.trackHeight
		color: Variables.theme.secondary
		radius: Math.min(this.width, this.height) / 2

		Style.ToolTip {
            extraVisibleCondition: slider.pressed
            content: slider.tooltipContent
        }

		Behavior on implicitWidth {
			NumberAnimation {
                duration: 200
				easing.type: Easing.BezierSpline
				easing.bezierCurve: [0, 0, 0, 1, 1, 1]
            }
		}
    }
}