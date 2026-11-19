import QtQuick
import QtQuick.Controls
import Quickshell.Io

Button {
    id: button

    required property list<string> command
    required property string icon_path

    background: Rectangle {
        anchors.centerIn: button
        implicitHeight: 30
        implicitWidth: icon.implicitWidth

        color: "transparent"

        Image {
            id: icon
            source: button.icon_path
            anchors.centerIn: parent
            sourceSize.height: 22
        }
    }

    Process {
        id: thing_to_execute
        command: button.command
        running: false
    }

    onClicked: {
        thing_to_execute.running = true
    }
}