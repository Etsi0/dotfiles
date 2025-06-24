import QtQuick
import "root:/config/"
import "root:/scripts/" as Script
import "root:/utils/"
import "root:/widgets/"
import "root:/widgets/Styles" as Styles

Styles.Btn {
	id: root
	onClicked: () => {
		if(Variables.activeWindow !== 'Audio') {
			Variables.activeWindow = '';
			Variables.activeWindow = 'Audio';
		} else {
			Variables.activeWindow = '';
		}
	}
	readonly property int volume: Math.round(Script.Audio.output.audio.volume * 100)

	Icon {
		iconName: root.volume === 0
			? 'materialDesignIcons/volume/volume_0'
			: FromArray.fn(1, root.volume, 100, [
				"materialDesignIcons/volume/volume_1",
				"materialDesignIcons/volume/volume_2",
				"materialDesignIcons/volume/volume_3"
			])
	}
}