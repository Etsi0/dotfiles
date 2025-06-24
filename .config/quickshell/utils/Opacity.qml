pragma Singleton
import Quickshell
import QtQuick

Singleton {
	function fn(color: color, opacity: real): color {
		return Qt.rgba(color.r, color.g, color.b, opacity);
	}
}