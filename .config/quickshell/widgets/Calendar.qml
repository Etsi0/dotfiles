import QtQuick
import QtQuick.Layouts
import "root:/config/"
import "root:/themes/" as Theme
import "root:/utils/"
import "root:/widgets/Styles" as Styles

GridLayout {
	id: root
	readonly property real childCount: 7
	property int year: new Date().getFullYear()
	property int month: new Date().getMonth()
	implicitWidth: popupRoot.width - this.columnSpacing * 2
	columns: this.childCount
	rowSpacing: 7.5
	columnSpacing: 7.5

	function createCalendarArray(year, month) {
		// month is 0-indexed (0 = January, 11 = December)
		const firstDayOfWeek = (new Date(year, month, 1).getDay() + 6) % 7 + 1;
		const daysInCurrentMonth = new Date(year, month + 1, 0).getDate();
		const daysInPrevMonth = new Date(year, month, 0).getDate();

		const calendar = [];

		// Add previous month's days
		for (let i = firstDayOfWeek - 1; i >= 0; i--) {
			calendar.push({
				year: year,
				month: month - 1,
				day: daysInPrevMonth - i,
				isCurrentMonth: false
			});
		}

		// Add current month's days
		for (let day = 1; day <= daysInCurrentMonth; day++) {
			calendar.push({
				year: year,
				month: month,
				day: day,
				isCurrentMonth: true
			});
		}

		// Add next month's days to fill remaining slots
		let nextMonthDay = 1;
		while (calendar.length < 42) {
			calendar.push({
				year: year,
				month: month + 1,
				day: nextMonthDay,
				isCurrentMonth: false
			});
			nextMonthDay++;
		}

		return calendar;
	}

	Repeater {
		model: createCalendarArray(root.year, root.month)
		Styles.Btn {
			readonly property var date: new Date()
			readonly property var colorConfig: modelData.year === date.getFullYear() && modelData.month === date.getMonth() && modelData.day === date.getDate()
				? { color: Opacity.fn(Theme[Variables.activeTheme].secondary, 1.0), text: Opacity.fn("#111", 1.0) }
				: { color: Opacity.fn("#808080", modelData.isCurrentMonth ? 0.12 : 0.06), text: Opacity.fn(Theme[Variables.activeTheme].text, 1.0) }

			color: colorConfig.color;
			implicitWidth: (root.width - root.columnSpacing * (root.childCount - 1)) / root.childCount
			height: this.implicitWidth

			Styles.Text {
				text: modelData.day
				color: colorConfig.text
			}
		}
	}
}