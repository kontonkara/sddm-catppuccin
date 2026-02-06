import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls
import SddmComponents 2.0

Column {
    spacing: config.inputSpacing || 15
    width: config.inputWidth || 400

    property string currentUser: userModel.lastUser

    // Username section
    Column {
        width: parent.width
        spacing: 8

        // Label above field
        Text {
            text: config.userLabel || "Username"
            font.family: config.font || "Inter"
            font.pixelSize: config.labelSize || 12
            color: config.labelColor || "#a6adc8"
        }

        // User field
        Loader {
            id: userLoader
            width: parent.width
            height: config.inputHeight || 50
            sourceComponent: config.userFieldType === "combobox" ? userComboBox : userTextField
        }
    }

    // ComboBox variant
    Component {
        id: userComboBox

        Controls.ComboBox {
            id: userBox
            model: userModel
            currentIndex: userModel.lastIndex
            textRole: "name"

            font.family: config.font || "Inter"
            font.pixelSize: config.fontSize || 14

            contentItem: Text {
                leftPadding: 15
                text: userBox.displayText
                font: userBox.font
                color: config.inputTextColor || "#cdd6f4"
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                radius: config.inputRadius || 10
                color: config.inputBgColor || "#313244"
                border.width: userBox.popup.visible ? 2 : 0
                border.color: config.inputBorderColor || "#b4befe"
            }

            popup: Controls.Popup {
                y: userBox.height + 5
                width: userBox.width
                padding: 10

                contentItem: ListView {
                    clip: true
                    implicitHeight: contentHeight
                    model: userModel
                    currentIndex: userBox.currentIndex

                    delegate: Controls.ItemDelegate {
                        width: userBox.width - 20
                        height: 40

                        contentItem: Text {
                            text: model.name
                            font: userBox.font
                            color: config.inputTextColor || "#cdd6f4"
                            verticalAlignment: Text.AlignVCenter
                        }

                        background: Rectangle {
                            radius: 5
                            color: index === userBox.currentIndex ?
                                   config.inputSelectedColor || "#585b70" :
                                   parent.hovered ? config.inputHoverColor || "#45475a" :
                                   "transparent"
                        }

                        onClicked: {
                            userBox.currentIndex = index
                            userBox.popup.close()
                        }
                    }
                }

                background: Rectangle {
                    radius: config.inputRadius || 10
                    color: config.inputBgColor || "#313244"
                    border.width: 2
                    border.color: config.inputBorderColor || "#b4befe"
                }
            }

            onCurrentTextChanged: {
                currentUser = currentText
                pass.forceActiveFocus()
            }

            Component.onCompleted: {
                currentUser = displayText
            }
        }
    }

    // TextField variant
    Component {
        id: userTextField

        Controls.TextField {
            id: singleUserField
            text: userModel.lastUser
            readOnly: config.allowEditUsername !== "true"
            activeFocusOnTab: config.allowEditUsername === "true"

            font.family: config.font || "Inter"
            font.pixelSize: config.fontSize || 14
            color: config.inputTextColor || "#cdd6f4"

            background: Rectangle {
                radius: config.inputRadius || 10
                color: config.inputBgColor || "#313244"
                // Border only if NOT readonly AND focused
                border.width: (config.allowEditUsername === "true" && singleUserField.activeFocus) ? 2 : 0
                border.color: config.inputBorderColor || "#b4befe"
            }

            leftPadding: 15
            rightPadding: 15

            onTextChanged: currentUser = text

            Component.onCompleted: {
                currentUser = text
            }
        }
    }

    // Password section
    Column {
        width: parent.width
        spacing: 8

        // Label above field
        Text {
            text: config.passwordLabel || "Password"
            font.family: config.font || "Inter"
            font.pixelSize: config.labelSize || 12
            color: config.labelColor || "#a6adc8"
        }

        // Password field
        Controls.TextField {
            id: pass
            width: parent.width
            height: config.inputHeight || 50
            echoMode: TextInput.Password
            focus: true

            font.family: config.font || "Inter"
            font.pixelSize: config.fontSize || 14
            color: config.inputTextColor || "#cdd6f4"

            background: Rectangle {
                radius: config.inputRadius || 10
                color: config.inputBgColor || "#313244"
                border.width: pass.activeFocus ? 2 : 0
                border.color: config.inputBorderColor || "#b4befe"
            }

            leftPadding: 15
            rightPadding: 15

            Keys.onPressed: (event) => {
                if (event.key === Qt.Key_Return) {
                    loginButton.clicked()
                }
            }
        }
    }

    // Login button
    Controls.Button {
        id: loginButton
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
        }

        onClicked: {
            sddm.login(currentUser, pass.text, sessionSelector.currentIndex)
        }
    }
}
