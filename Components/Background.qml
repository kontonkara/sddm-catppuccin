import QtQuick 2.15
import QtMultimedia

Item {
    id: background
    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: config.backgroundColor || "#1e1e2e"
        visible: config.backgroundType === "color"
    }

    Image {
        id: staticImage
        anchors.fill: parent
        source: config.backgroundType === "image" ? Qt.resolvedUrl("../" + config.backgroundPath) : ""
        fillMode: Image.PreserveAspectCrop
        asynchronous: true  // async load
        cache: true
        smooth: false  // disable antialiasing for performance
        visible: config.backgroundType === "image"

        onStatusChanged: {
            if (status === Image.Error) {
                console.log("ERROR: Failed to load image:", source)
            }
        }
    }

    AnimatedImage {
        id: gifImage
        anchors.fill: parent
        source: config.backgroundType === "gif" ? Qt.resolvedUrl("../" + config.backgroundPath) : ""
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        playing: visible  // only play when visible
        visible: config.backgroundType === "gif"

        onStatusChanged: {
            if (status === AnimatedImage.Error) {
                console.log("ERROR: Failed to load GIF:", source)
            }
        }
    }

    Item {
        anchors.fill: parent
        visible: config.backgroundType === "video"

        MediaPlayer {
            id: videoPlayer
            videoOutput: videoOut
            autoPlay: true
            loops: MediaPlayer.Infinite
            source: config.backgroundType === "video" ? Qt.resolvedUrl("../" + config.backgroundPath) : ""

            onErrorOccurred: {
                console.log("ERROR: Video playback failed")
            }
        }

        VideoOutput {
            id: videoOut
            anchors.fill: parent
            fillMode: VideoOutput.PreserveAspectCrop
        }
    }

    Rectangle {
        anchors.fill: parent
        color: config.dimColor || "#000000"
        opacity: config.dimOpacity || 0.0
    }
}
