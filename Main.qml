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

    // Clock container
    Rectangle {
        id: clockContainer
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: config.clockTopMargin || 50

        width: clockItem.width + (config.clockContainerPadding || 30) * 2
        height: clockItem.height + (config.clockContainerPadding || 30) * 2

        color: config.clockContainerBg || "transparent"
        radius: config.clockContainerRadius || 15
        opacity: config.clockContainerOpacity || 0.8
        visible: (config.clockContainerBg || "transparent") !== "transparent"

        Clock {
            id: clockItem
            anchors.centerIn: parent
        }
    }

    // Clock without container
    Clock {
        id: clockNoContainer
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: config.clockTopMargin || 50
        visible: (config.clockContainerBg || "transparent") === "transparent"
    }

    // Login form container
    Rectangle {
        id: formContainer
        anchors.centerIn: parent

        width: form.width + (config.formContainerPadding || 40) * 2
        height: form.height + (config.formContainerPadding || 40) * 2

        color: config.formContainerBg || "#1e1e2e"
        radius: config.formContainerRadius || 20
        opacity: config.formContainerOpacity || 0.9

        LoginForm {
            id: form
            anchors.centerIn: parent
        }
    }

    // Session selector
    SessionSelector {
        id: sessionSelector
        anchors.top: formContainer.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: config.sessionTopMargin || 40
    }

    // Power buttons container
    Rectangle {
        id: powerContainer
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: config.powerBottomMargin || 50

        width: powerButtons.width + (config.powerContainerPadding || 20) * 2
        height: powerButtons.height + (config.powerContainerPadding || 20) * 2

        color: config.powerContainerBg || "transparent"
        radius: config.powerContainerRadius || 12
        opacity: config.powerContainerOpacity || 0.8
        visible: (config.powerContainerBg || "transparent") !== "transparent"

        PowerButtons {
            id: powerButtons
            anchors.centerIn: parent
        }
    }

    // Power buttons without container
    PowerButtons {
        id: powerNoContainer
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: config.powerBottomMargin || 50
        visible: (config.powerContainerBg || "transparent") === "transparent"
    }
}
