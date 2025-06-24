import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "root:/config/"
import "root:/utils/"
import "root:/widgets/Styles/" as Style

ToolTip {
    id: root
    property string content
    property bool extraVisibleCondition: true
    property bool alternativeVisibleCondition: false
    property bool internalVisibleCondition: {
        const ans = (extraVisibleCondition && (parent.hovered === undefined || parent?.hovered)) || alternativeVisibleCondition
        return ans
    }
    verticalPadding: 5
    horizontalPadding: 10
    opacity: internalVisibleCondition ? 1 : 0
    visible: opacity > 0

    Behavior on opacity {
        NumberAnimation {
            duration: Appearance.animation.elementMoveFast.duration
            easing.type: Appearance.animation.elementMoveFast.type
            easing.bezierCurve: Appearance.animation.elementMoveFast.bezierCurve
        }
    }

    background: null

    contentItem: Item {
        id: contentItemBackground
        implicitWidth: tooltipTextObject.width + 2 * root.horizontalPadding
        implicitHeight: tooltipTextObject.height + 2 * root.verticalPadding

        Rectangle {
            id: backgroundRectangle
            anchors.bottom: contentItemBackground.bottom
            anchors.horizontalCenter: contentItemBackground.horizontalCenter
            color: Opacity.fn("#282828", 1.0)
			border.width: 1
			border.color: Opacity.fn('#808080', 0.1875)
            radius: Math.min(this.width, this.height) / 3
            width: internalVisibleCondition ? (tooltipTextObject.width + 2 * padding) : 0
            height: internalVisibleCondition ? (tooltipTextObject.height + 2 * padding) : 0
            clip: true

            Behavior on width {
                NumberAnimation {
                    duration: Appearance.animation.elementMoveFast.duration
                    easing.type: Appearance.animation.elementMoveFast.type
                    easing.bezierCurve: Appearance.animation.elementMoveFast.bezierCurve
                }
            }
            Behavior on height {
                NumberAnimation {
                    duration: Appearance.animation.elementMoveFast.duration
                    easing.type: Appearance.animation.elementMoveFast.type
                    easing.bezierCurve: Appearance.animation.elementMoveFast.bezierCurve
                }
            }

            Style.Text {
                id: tooltipTextObject
                anchors.centerIn: parent
                text: content
                font.pixelSize: Appearance.font.pixelSize.smaller
                font.hintingPreference: Font.PreferNoHinting // Prevent shaky text
                color: Opacity.fn(Variables.theme.text, 1.0)
                wrapMode: Text.Wrap
            }
        }
    }
}