import QtQuick
import Quickshell.Hyprland

Rectangle {
    id: workspace_viewer

    required property int height_model

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
                        height_model: workspace_viewer.height_model - 4
                    }

                    WorkspaceButton {
                        workspace_id: 1
                        height_model: workspace_viewer.height_model - 4
                    }

                    WorkspaceButton {
                        workspace_id: 2
                        height_model: workspace_viewer.height_model - 4
                    }

                    WorkspaceButton {
                        workspace_id: 3
                        height_model: workspace_viewer.height_model - 4
                    }

                    WorkspaceButton {
                        workspace_id: 4
                        height_model: workspace_viewer.height_model - 4
                    }

                    WorkspaceButton {
                        workspace_id: 5
                        height_model: workspace_viewer.height_model - 4
                    }

                    WorkspaceButton {
                        workspace_id: 6
                        height_model: workspace_viewer.height_model - 4
                    }

                    WorkspaceButton {
                        workspace_id: 7
                        height_model: workspace_viewer.height_model - 4
                    }

                    WorkspaceButton {
                        workspace_id: 8
                        height_model: workspace_viewer.height_model - 4
                    }
                }
            }
        }

        WindowNameViewer {
            height_model: workspace_viewer.height_model
        }
    }    
}