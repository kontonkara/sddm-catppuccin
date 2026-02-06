import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls
import SddmComponents 2.0

Row {
    spacing: config.powerButtonSpacing || 20

    // Shutdown
    Controls.Button {
        width: config.powerButtonSize || 50
        height: config.powerButtonSize || 50
        visible: config.showPowerButtons === "true" ? true : sddm.canPowerOff

        contentItem: Text {
            text: "⏻"
            font.pixelSize: config.powerIconSize || 24
            color: config.powerButtonColor || "#f38ba8"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            radius: config.powerButtonRadius || 10
            color: parent.down ? config.powerButtonPressedBg || "#45475a" :
                   parent.hovered ? config.powerButtonHoverBg || "#313244" :
                   config.powerButtonBg || "transparent"
            border.width: 2
            border.color: config.powerButtonColor || "#f38ba8"
        }

        onClicked: sddm.powerOff()
    }

    // Reboot
    Controls.Button {
        width: config.powerButtonSize || 50
        height: config.powerButtonSize || 50
        visible: config.showPowerButtons === "true" ? true : sddm.canReboot

        contentItem: Text {
            text: "↻"
            font.pixelSize: config.powerIconSize || 24
            color: config.rebootButtonColor || "#fab387"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            radius: config.powerButtonRadius || 10
            color: parent.down ? config.powerButtonPressedBg || "#45475a" :
                   parent.hovered ? config.powerButtonHoverBg || "#313244" :
                   config.powerButtonBg || "transparent"
            border.width: 2
            border.color: config.rebootButtonColor || "#fab387"
        }

        onClicked: sddm.reboot()
    }
}
