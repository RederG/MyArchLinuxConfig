import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    required property int height_model

    implicitHeight: height_model
    implicitWidth: main_rect.implicitWidth

    color: "#4700b3ff"

    border {
        color: "#b700ffe1"
        width: 2
    }

    radius: 15.0

    Rectangle {
        id: main_rect
        implicitHeight: controls.implicitHeight
        implicitWidth: controls.implicitWidth + 28

        color: "transparent"

        RowLayout {
            id: controls
            spacing: 10

            anchors.centerIn: parent

            Control {
                icon_path: "icons/Clipboard.png"
                command: ["clipcat-menu"]
                height_model: root.height_model
            }

            Control {
                icon_path: "icons/Wifi.svg"
                command: [""]
                height_model: root.height_model
            }
            
            Control {
                icon_path: "icons/Power-button.svg"
                command: ["fish", "-c", "system_state_changer"]
                height_model: root.height_model
            }
        }
    }
}