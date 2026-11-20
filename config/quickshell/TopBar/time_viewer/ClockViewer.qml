import QtQuick

Rectangle {
    required property int height_model
    required property real rect_corner_radius

    implicitHeight: height_model
    implicitWidth: time_text.implicitWidth + 20

    radius: rect_corner_radius

    Text {
        id: time_text
        text: TimeGetter.time

        anchors.centerIn: parent

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 14
        color: "white"
    }
}