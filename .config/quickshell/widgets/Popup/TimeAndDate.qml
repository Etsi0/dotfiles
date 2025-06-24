import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "root:/config/"
import "root:/themes/" as Theme
import "root:/scripts/"
import "root:/utils/"
import "root:/widgets"
import "root:/widgets/Styles" as Styles

ColumnLayout {
	id: root
	property int offset: new Date().getMonth()
	readonly property int month: ((root.offset % 12) + 12) % 12
	readonly property int year: new Date().getFullYear() + Math.floor(root.offset / 12)

	RowLayout {
		Styles.Text {
			text: `${['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][root.month]} ${year}`
		}

		Item {
			Layout.fillWidth: true
		}

		Styles.Btn {
			onClicked: () => { root.offset-- }

			Icon {
				iconName: 'materialDesignIcons/arrow_up'
			}
		}

		Styles.Btn {
			onClicked: () => { root.offset++ }

			Icon {
				iconName: 'materialDesignIcons/arrow_down'
			}
		}
	}

	Calendar {
		year: root.year
		month: root.month
	}
}