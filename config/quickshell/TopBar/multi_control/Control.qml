import QtQuick
import QtQuick.Controls
import Quickshell.Io

Rectangle {
    id: root

    required property string icon_path
    required property list<string> command

    implicitHeight: button.implicitHeight
    implicitWidth: button.implicitWidth

    color: "transparent"

    border.color: "transparent"

    Button {
        id: button

        background: Image {
            source: root.icon_path
            anchors.centerIn: parent
            sourceSize.height: 28
        }

        Process {
            id: thing_to_execute
            command: root.command
            running: false
        }

        onClicked: {
            thing_to_execute.running = true
        }
    }
}