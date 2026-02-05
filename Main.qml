import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls
import SddmComponents 2.0

import "Components"

Rectangle {
    id: root
    width: Screen.width
    height: Screen.height

    Background {
        id: bg
    }

    LoginForm {
        id: form
        anchors.centerIn: parent
    }
}
