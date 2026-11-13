import QtQuick
import Quickshell.Hyprland

Rectangle {
    Row {

        Rectangle {
            implicitHeight: workspaces_rect.implicitHeight + 4
            implicitWidth: workspaces_rect.implicitWidth + 4

            color: "transparent"

            border {
                color: '#b700ffe1'
                width: 2
            }

            radius: 17.0

            Rectangle {
                id: workspaces_rect
                color: '#4700b3ff'

                implicitHeight: workspaces.implicitHeight
                implicitWidth: workspaces.implicitWidth

                anchors.centerIn: parent

                radius: 15.0

                Behavior on implicitWidth {
                    PropertyAnimation {
                        easing.type: Easing.BezierSpline
                    }
                }

                Row {
                    id: workspaces
                    spacing: 5

                    WorkspaceButton {
                        workspace_id: 0
                    }

                    WorkspaceButton {
                        workspace_id: 1
                    }

                    WorkspaceButton {
                        workspace_id: 2
                    }

                    WorkspaceButton {
                        workspace_id: 3
                    }

                    WorkspaceButton {
                        workspace_id: 4
                    }

                    WorkspaceButton {
                        workspace_id: 5
                    }

                    WorkspaceButton {
                        workspace_id: 6
                    }

                    WorkspaceButton {
                        workspace_id: 7
                    }

                    WorkspaceButton {
                        workspace_id: 8
                    }
                }
            }
        }

        Rectangle {
            implicitHeight: workspaces_rect.implicitHeight + 5
            implicitWidth: window_title.implicitWidth + 5

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
                    let max_size = 60
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
    }    
}