pragma Singleton
import Quickshell
import QtQuick
import "root:/utils/"

Singleton {
	function fn(start: real, variable: real, stop: real, array: array): any {
		return array[Clamp.fn(0, Math.floor((variable - start) / (stop - start) * array.length), array.length - 1)]
	}
}