import QtQuick
import Quickshell.Hyprland

Rectangle {
    required property int height_model

    implicitHeight: height_model
    implicitWidth: window_title.implicitWidth + 8

    color: "transparent"

    Text {
        id: window_title

        property string window_name: {
            let current_window_name = "";
            Hyprland.workspaces.values.map((workspace) => {
                if(workspace.active) {
                    for(let j = 0; j < workspace.toplevels.values.length; j++) {
                        let toplevel = workspace.toplevels.values[j]
                        if(toplevel.activated) {
                            current_window_name = toplevel.title
                        }
                    }
                }
            })
            let max_size = 52
            if(current_window_name.length > max_size) {
                current_window_name = current_window_name.substring(0, max_size) + "..."
            }
            return current_window_name
        }

        text: window_name
        
        color: "white"

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 14
        anchors.centerIn: parent
    }
}