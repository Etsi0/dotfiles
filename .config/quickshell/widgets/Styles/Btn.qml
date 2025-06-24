import QtQuick
import "root:/config/"
import "root:/themes/" as Theme
import "root:/utils/"

Rectangle {
	id: root
	property bool active: false
	property var cursorShape: { Qt.PointingHandCursor }
	property bool hoverEnabled: true
	property var onEntered: () => { active = true }
	property var onExited: () => { active = false }
	property var onClicked: () => {}
	property int spacing: 0

	default property alias children: row.children

	implicitWidth: row.width + 7.5
	height: Variables.height - 7.5
	radius: Math.min(this.implicitWidth, this.height) / 3
	color: Opacity.fn('#808080', this.active ? 0.12 : 0)
	border.width: 1
	border.color: Opacity.fn('#808080', this.active ? 0.1875 : 0)

	MouseArea {
		anchors.fill: root
		cursorShape: root.cursorShape
		hoverEnabled: root.hoverEnabled
		onEntered: root.onEntered()
		onExited: root.onExited()
		onClicked: root.onClicked()
	}

	Row {
		id: row
		anchors {
			horizontalCenter: root.horizontalCenter
			verticalCenter: root.verticalCenter
		}

		spacing: root.spacing

		onChildrenChanged: {
			for (var i = 0; i < children.length; i++) {
				var child = children[i]
				if (child) {
					child.height = Qt.binding(function() { return root.height * 0.7272727272 })
					child.anchors.verticalCenter = Qt.binding(function() { return row.verticalCenter })
				}
			}
		}
	}
}