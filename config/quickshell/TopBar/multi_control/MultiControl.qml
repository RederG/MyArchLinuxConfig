import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    required property int height_model
    required property int rect_border_width
    required property real rect_corner_radius

    implicitHeight: height_model
    implicitWidth: all_controls.implicitWidth

    color: "#4700b3ff"

    border {
        color: "#b700ffe1"
        width: root.rect_border_width
    }

    radius: rect_corner_radius

    AllControls {
        id: all_controls
        height_model: root.height_model
        rect_corner_radius: root.rect_corner_radius
    }
}