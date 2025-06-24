import QtQuick
import "root:/config/"
import "root:/scripts/" as Script
import "root:/utils/"
import "root:/widgets/"
import "root:/widgets/Styles" as Styles

Styles.Btn {
	id: root
	onClicked: () => {
		if(Variables.activeWindow !== 'Battery') {
			Variables.activeWindow = '';
			Variables.activeWindow = 'Battery';
		} else {
			Variables.activeWindow = '';
		}
	}
	readonly property string prefix: Script.Battery.isCharging ? '_charging' : ''

	Styles.Text {
		text: Script.Battery.percentage
	}

	Icon {
		iconName: FromArray.fn(0, Script.Battery.percentage, 100, [
			`materialDesignIcons/battery/battery${root.prefix}_0_bar`,
			`materialDesignIcons/battery/battery${root.prefix}_1_bar`,
			`materialDesignIcons/battery/battery${root.prefix}_2_bar`,
			`materialDesignIcons/battery/battery${root.prefix}_3_bar`,
			`materialDesignIcons/battery/battery${root.prefix}_4_bar`,
			`materialDesignIcons/battery/battery${root.prefix}_5_bar`,
			`materialDesignIcons/battery/battery${root.prefix}_6_bar`,
			`materialDesignIcons/battery/battery${root.prefix}_7_bar`
		])
	}
}