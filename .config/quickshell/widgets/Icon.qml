import QtQuick
import "root:/config/"

Image {
	property string iconName: ""

	width: 20
	height: 20
	source: iconName ? Variables.iconFolder + iconName + ".svg" : ""

	onStatusChanged: {
		if (status === Image.Error && iconName) {
			source = Variables.iconFolder + "/onError.svg";
		}
	}
}