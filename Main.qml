import QtQuick 2.15
import QtQuick.Controls 2.15
import SddmComponents 2.0

Rectangle {
    width: 1920
    height: 1080
    color: "#1a1a2e"

    Column {
        anchors.centerIn: parent
        spacing: 20
        width: 300

        TextField {
            id: user
            width: parent.width
            placeholderText: "Username"
            text: userModel.lastUser
        }

        TextField {
            id: pass
            width: parent.width
            placeholderText: "Password"
            echoMode: TextInput.Password

            Keys.onPressed: (event) => {
                if (event.key === Qt.Key_Return) {
                    sddm.login(user.text, pass.text, 0)
                }
            }
        }

        Button {
            width: parent.width
            text: "Login"
            onClicked: sddm.login(user.text, pass.text, 0)
        }
    }
}
