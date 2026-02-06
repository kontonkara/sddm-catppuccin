import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls
import SddmComponents 2.0

Controls.ComboBox {
    id: sessionBox

    width: config.inputWidth || 400
    height: config.sessionHeight || 40

    model: sessionModel
    currentIndex: sessionModel.lastIndex
    textRole: "name"

    font.family: config.font || "Inter"
    font.pixelSize: config.fontSize || 14

    contentItem: Text {
        leftPadding: 15
        text: sessionBox.displayText
        font: sessionBox.font
        color: config.sessionTextColor || "#cdd6f4"
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        radius: config.sessionRadius || 10
        color: config.sessionBgColor || "#313244"
        border.width: sessionBox.popup.visible ? 2 : 0
        border.color: config.sessionBorderColor || "#b4befe"
    }

    popup: Controls.Popup {
        y: sessionBox.height + 5
        width: sessionBox.width
        padding: 10

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: sessionModel  // direct model, not delegateModel
            currentIndex: sessionBox.currentIndex

            delegate: Controls.ItemDelegate {
                width: sessionBox.width - 20
                height: 40

                // Always show all items
                contentItem: Text {
                    text: model.name
                    font: sessionBox.font
                    color: config.sessionTextColor || "#cdd6f4"
                    verticalAlignment: Text.AlignVCenter
                }

                background: Rectangle {
                    radius: 5
                    color: index === sessionBox.currentIndex ?
                           config.sessionSelectedColor || "#585b70" :
                           parent.hovered ? config.sessionHoverColor || "#45475a" :
                           "transparent"
                }

                onClicked: {
                    sessionBox.currentIndex = index
                    sessionBox.popup.close()
                }
            }
        }

        background: Rectangle {
            radius: config.sessionRadius || 10
            color: config.sessionBgColor || "#313244"
            border.width: 2
            border.color: config.sessionBorderColor || "#b4befe"
        }
    }
}
