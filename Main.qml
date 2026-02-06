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

    // Clock - top center
    Clock {
        id: clock
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: config.clockTopMargin || 50
    }

    // Login form - center
    LoginForm {
        id: form
        anchors.centerIn: parent
    }

    // Session selector - below login button with bigger margin
    SessionSelector {
        id: sessionSelector
        anchors.top: form.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: config.sessionTopMargin || 40
    }

    // Power buttons - bottom center
    PowerButtons {
        id: powerButtons
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: config.powerBottomMargin || 50
    }
}
