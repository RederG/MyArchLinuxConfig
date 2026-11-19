import QtQuick
import QtQuick.Controls
import Quickshell.Io

Button {
    id: control

    required property list<string> command
    required property string icon_path
    required property string height_model

    function icon_height() {
        return height_model - (height_model * 0.3)
    }

    background: Rectangle {
        anchors.centerIn: control
        implicitHeight: control.height_model
        implicitWidth: icon.implicitWidth

        color: "transparent"

        Image {
            id: icon
            source: control.icon_path
            anchors.centerIn: parent
            sourceSize.height: control.icon_height()
        }
    }

    Process {
        id: thing_to_execute
        command: control.command
        running: false
    }

    onClicked: {
        thing_to_execute.running = true
    }
}