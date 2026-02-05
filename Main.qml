import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls  // alias
import SddmComponents 2.0

Rectangle {
    width: 1920
    height: 1080
    color: "#1a1a2e"

    Column {
        anchors.centerIn: parent
        spacing: 20
        width: 300

        Controls.TextField {  // explicit
            id: user
            width: parent.width
            placeholderText: "Username"
            text: userModel.lastUser
        }

        Controls.TextField {  // explicit
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

        Controls.Button {  // explicit - uses Qt Controls, not SddmComponents
            width: parent.width
            text: "Login"
            onClicked: sddm.login(user.text, pass.text, 0)
        }
    }
}
