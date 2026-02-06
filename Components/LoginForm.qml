import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls
import SddmComponents 2.0

Column {
    spacing: config.inputSpacing || 15
    width: config.inputWidth || 400

    // Username field
    Controls.TextField {
        id: user
        width: parent.width
        height: config.inputHeight || 50
        placeholderText: config.userPlaceholder || "Username"
        text: userModel.lastUser

        font.family: config.font || "Inter"
        font.pixelSize: config.fontSize || 14

        color: config.inputTextColor || "#cdd6f4"
        placeholderTextColor: config.inputPlaceholderColor || "#6c7086"

        background: Rectangle {
            radius: config.inputRadius || 10
            color: config.inputBgColor || "#313244"
            border.width: user.activeFocus ? config.inputBorderWidth || 2 : 0
            border.color: config.inputBorderColor || "#b4befe"

            Behavior on border.width { NumberAnimation { duration: 150 } }
        }

        leftPadding: 15
        rightPadding: 15
    }

    // Password field
    Controls.TextField {
        id: pass
        width: parent.width
        height: config.inputHeight || 50
        placeholderText: config.passwordPlaceholder || "Password"
        echoMode: TextInput.Password

        font.family: config.font || "Inter"
        font.pixelSize: config.fontSize || 14

        color: config.inputTextColor || "#cdd6f4"
        placeholderTextColor: config.inputPlaceholderColor || "#6c7086"

        background: Rectangle {
            radius: config.inputRadius || 10
            color: config.inputBgColor || "#313244"
            border.width: pass.activeFocus ? config.inputBorderWidth || 2 : 0
            border.color: config.inputBorderColor || "#b4befe"

            Behavior on border.width { NumberAnimation { duration: 150 } }
        }

        leftPadding: 15
        rightPadding: 15

        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Return) {
                sddm.login(user.text, pass.text, 0)
            }
        }
    }

    // Login button
    Controls.Button {
        width: parent.width
        height: config.buttonHeight || 50
        text: config.loginButtonText || "Login"

        contentItem: Text {
            text: parent.text
            font.family: config.font || "Inter"
            font.pixelSize: config.fontSize || 14
            font.bold: true
            color: config.buttonTextColor || "#1e1e2e"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            radius: config.buttonRadius || 10
            color: parent.down ? config.buttonPressedColor || "#a6adc8" :
                   parent.hovered ? config.buttonHoverColor || "#cba6f7" :
                   config.buttonBgColor || "#b4befe"

            Behavior on color { ColorAnimation { duration: 150 } }
        }

        onClicked: sddm.login(user.text, pass.text, 0)
    }
}
