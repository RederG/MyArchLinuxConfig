import QtQuick
import QtQuick.Layouts

Rectangle {
    implicitHeight: 30
    implicitWidth: child.implicitWidth

    color: "#4700b3ff"

    border {
        color: "#b700ffe1"
        width: 2
    }

    radius: 15.0

    RowLayout {
        id: child
        spacing: 20

        Control {
            icon_path: "icons/Clipboard.png"
            command: ["clipcat-menu"]
        }

        Control {
            icon_path: "icons/Wifi.svg"
            command: [""]
        }
        
        Control {
            icon_path: "icons/Power-button.svg"
            command: ["fish", "-c", "system_state_changer"]
        }
    }
}