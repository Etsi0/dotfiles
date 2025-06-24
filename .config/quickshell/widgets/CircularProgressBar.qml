import QtQuick
import "root:/config/"
import "root:/themes/" as Theme
import "root:/utils/"

Canvas {
	id: root

	property real degree: 0
	property int size: parent.width - 7.5 * 2
	property int lineWidth: this.width * 0.075
	property real value: 0
	property int animationDuration: 1000

	anchors.fill: parent
	antialiasing: true

	onDegreeChanged: {
		requestPaint();
	}

	onPaint: {
		let ctx = getContext("2d");

		let x = root.width/2;
		let y = root.height/2;

		let radius = root.size/2 - root.lineWidth
		let startAngle = (Math.PI/180) * 270;
		let fullAngle = (Math.PI/180) * (270 + 360);
		let progressAngle = (Math.PI/180) * (270 + degree);

		ctx.reset()

		ctx.lineCap = 'round';
		ctx.lineWidth = root.lineWidth;

		ctx.beginPath();
		ctx.arc(x, y, radius, startAngle, fullAngle);
		ctx.strokeStyle = Opacity.fn('#808080', 0.25);
		ctx.stroke();

		ctx.beginPath();
		ctx.arc(x, y, radius, startAngle, progressAngle);
		ctx.strokeStyle = Opacity.fn(Variables.theme.secondary, 1.0);
		ctx.stroke();
	}

	Behavior on degree {
		NumberAnimation {
			duration: root.animationDuration
		}
	}
}