import QtQuick
import QtQuick.Controls
import Quickshell.Io

Button {
    id: control

    required property list<string> command
    required property string icon_path
    required property string height_model
    required property real rect_corner_radius

    function icon_height() {
        return height_model - (height_model * 0.3)
    }

    background: Rectangle {
        anchors.centerIn: control
        implicitHeight: control.height_model
        implicitWidth: icon.implicitWidth + 10

        color: "transparent"

        radius: control.rect_corner_radius

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