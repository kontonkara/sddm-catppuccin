import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls
import SddmComponents 2.0

Column {
    spacing: 20
    width: 300

    Controls.TextField {
        id: user
        width: parent.width
        placeholderText: "Username"
        text: userModel.lastUser

        palette.base: "#313244"
        palette.text: "#cdd6f4"
        color: "#cdd6f4"
    }

    Controls.TextField {
        id: pass
        width: parent.width
        placeholderText: "Password"
        echoMode: TextInput.Password

        palette.base: "#313244"
        palette.text: "#cdd6f4"
        color: "#cdd6f4"

        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Return) {
                sddm.login(user.text, pass.text, 0)
            }
        }
    }

    Controls.Button {
        width: parent.width
        text: "Login"

        palette.button: "#b4befe"
        palette.buttonText: "#1e1e2e"

        onClicked: sddm.login(user.text, pass.text, 0)
    }
}
