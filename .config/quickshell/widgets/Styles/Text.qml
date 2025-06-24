import QtQuick
import "root:/config/"
import "root:/themes/" as Theme

Text {
    renderType: Text.NativeRendering
    font.hintingPreference: Font.PreferFullHinting
    verticalAlignment: Text.AlignVCenter
    font.family: Variables.fontFamily
    font.pixelSize: Variables.fontSize
    color: Theme[Variables.activeTheme].text
}