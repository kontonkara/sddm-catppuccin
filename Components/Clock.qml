import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls

Column {
    spacing: config.clockSpacing || 5

    Controls.Label {
        id: timeLabel
        anchors.horizontalCenter: parent.horizontalCenter

        font.family: config.font || "Inter"
        font.pixelSize: config.clockTimeSize || 64
        font.bold: true
        color: config.clockColor || "#cdd6f4"

        function updateTime() {
            text = Qt.formatTime(new Date(), config.clockTimeFormat || "hh:mm")
        }
    }

    Controls.Label {
        id: dateLabel
        anchors.horizontalCenter: parent.horizontalCenter

        font.family: config.font || "Inter"
        font.pixelSize: config.clockDateSize || 18
        color: config.clockColor || "#cdd6f4"

        function updateTime() {
            text = Qt.formatDate(new Date(), config.clockDateFormat || "dddd, MMMM d")
        }
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            timeLabel.updateTime()
            dateLabel.updateTime()
        }
    }

    Component.onCompleted: {
        timeLabel.updateTime()
        dateLabel.updateTime()
    }
}
