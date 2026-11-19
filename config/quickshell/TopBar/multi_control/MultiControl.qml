import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    required property int height_model

    implicitHeight: height_model
    implicitWidth: all_controls.implicitWidth

    color: "#4700b3ff"

    border {
        color: "#b700ffe1"
        width: 2
    }

    radius: 15.0

    AllControls {
        id: all_controls
        height_model: root.height_model
    }
}