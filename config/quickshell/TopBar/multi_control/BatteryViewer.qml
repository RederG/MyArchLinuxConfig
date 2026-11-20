import QtQuick
import QtQuick.Controls
import Quickshell.Io

Button {
    id: battery_viewer

    required property string height_model
    required property real rect_corner_radius

    background: Rectangle {
        anchors.centerIn: battery_viewer
        implicitHeight: battery_viewer.height_model
        implicitWidth: battery.width

        Battery {
            id: battery
            height_model: battery_viewer.height_model
        }
    }

    Process {
        id: thing_to_execute
        running: false
    }

    onClicked: {
        thing_to_execute.running = true
    }
}