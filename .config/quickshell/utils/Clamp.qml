pragma Singleton
import Quickshell
import QtQuick

Singleton {
	function fn(min: real, value: real, max: real): real {
		return Math.max(min, Math.min(value, max));
	}
}