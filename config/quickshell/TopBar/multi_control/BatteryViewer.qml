import QtQuick
import QtQuick.Controls

Button {
    id: battery_viewer

    required property string height_model
    required property real rect_corner_radius

    visible: battery.has_battery

    background: Rectangle {
        anchors.centerIn: battery_viewer
        implicitHeight: battery_viewer.height_model
        implicitWidth: battery.width

        color: "transparent"

        Battery {
            id: battery
            height_model: battery_viewer.height_model
        }
    }
}