import QtQuick
import Quickshell
import Quickshell.Io
import "root:/config/"
import "root:/themes/" as Theme
import "root:/utils/"
import "root:/widgets/Styles" as Styles

Item {
	id: root
	implicitWidth: btn.implicitWidth
	implicitHeight: btn.height

	Styles.Btn {
		id: btn
		spacing: 3
		onClicked: () => {
			if(Variables.activeWindow !== 'TimeAndDate') {
				Variables.activeWindow = '';
				Variables.activeWindow = 'TimeAndDate';
			} else {
				Variables.activeWindow = '';
			}
		}

		Loader {
			active: Variables.isClockVisible;
			sourceComponent: Styles.Text {
				text: Qt.formatDateTime(clock.date, "hh:mm")
			}
		}

		Loader {
			active: Variables.isClockVisible && Variables.isDateVisible;
			sourceComponent: Styles.Text {
				text: '•'
				color: Opacity.fn(Theme[Variables.activeTheme].text, 0.75)
			}
		}

		Loader {
			active: Variables.isDateVisible;
			sourceComponent: Styles.Text {
				text: Qt.formatDateTime(clock.date, "yyyy/MM/dd")
			}
		}
	}

	SystemClock {
		id: clock
		precision: SystemClock.Minutes
	}
}