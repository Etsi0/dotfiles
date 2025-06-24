import QtQuick
import "root:/config/"
import "root:/themes/" as Theme
import "root:/utils/"

Rectangle {
	id: root

	implicitHeight: Variables.height
	radius: Variables.radius
	color: Opacity.fn(Theme[Variables.activeTheme].background, 0.75)
	border.width: 1
	border.color: Opacity.fn('#808080', 0.1563)
}