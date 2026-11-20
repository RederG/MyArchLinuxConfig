import QtQuick
import QtQuick.Layouts

Rectangle {
    id: main_rect
    implicitHeight: controls.implicitHeight
    implicitWidth: controls.implicitWidth + 28

    required property int height_model
    required property real rect_corner_radius

    color: "transparent"

    RowLayout {
        id: controls
        spacing: 10

        anchors.centerIn: parent

        Control {
            icon_path: "icons/Clipboard.png"
            command: ["clipcat-menu"]
            height_model: main_rect.height_model
            rect_corner_radius: main_rect.rect_corner_radius
        }

        Control {
            icon_path: "icons/Sound.png"
            command: ["pavucontrol"]
            height_model: main_rect.height_model
            rect_corner_radius: main_rect.rect_corner_radius
        }
        
        Control {
            icon_path: "icons/Power-button.svg"
            command: ["fish", "-c", "system_state_changer"]
            height_model: main_rect.height_model
            rect_corner_radius: main_rect.rect_corner_radius
        }
    }
}