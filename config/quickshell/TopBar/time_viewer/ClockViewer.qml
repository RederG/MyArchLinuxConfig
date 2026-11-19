import QtQuick

Rectangle {
    required property int height_model

    implicitHeight: height_model
    implicitWidth: time_text.implicitWidth + 20

    radius: 16.0

    Text {
        id: time_text
        text: TimeGetter.time

        anchors.centerIn: parent

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 14
        color: "white"
    }
}