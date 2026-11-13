import QtQuick

Rectangle {

    implicitHeight: time_text.implicitHeight + 8
    implicitWidth: time_text.implicitWidth + 50

    radius: 11.0

    Text {
        id: time_text
        text: TimeGetter.time

        anchors.centerIn: parent

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 14
        color: "white"
    }
}