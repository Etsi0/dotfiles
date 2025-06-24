import QtQuick
import "root:/config/"
import "root:/scripts/" as Script
import "root:/utils/"
import "root:/widgets/"
import "root:/widgets/Styles" as Styles

Styles.Btn {
	id: root
	onClicked: () => {
		if(Variables.activeWindow !== 'Network') {
			Variables.activeWindow = '';
			Variables.activeWindow = 'Network';
		} else {
			Variables.activeWindow = '';
		}
	}

	Icon {
		id: icon
		iconName: Script.Network.networkType === 'ethernet'
			? 'ethernet'
			: Script.Network.networkType === 'wifi' && Script.Network.networkStrength
				? FromArray.fn(0, Script.Network.networkStrength, 100, [
					'materialDesignIcons/wifi/wifi_0_bar',
					'materialDesignIcons/wifi/wifi_1_bar',
					'materialDesignIcons/wifi/wifi_2_bar',
					'materialDesignIcons/wifi/wifi_3_bar',
					'materialDesignIcons/wifi/wifi_4_bar'
				])
				: 'materialDesignIcons/wifi/globe'
	}
}