import QtQuick
import Quickshell.Hyprland

Rectangle {
    id: workspace_viewer

    required property int height_model
    required property real rect_corner_radius

    Row {
        Rectangle {
            implicitHeight: workspaces_rect.implicitHeight + 4
            implicitWidth: workspaces_rect.implicitWidth + 4

            color: "transparent"

            border {
                color: '#b700ffe1'
                width: 2
            }

            radius: workspace_viewer.rect_corner_radius

            Rectangle {
                id: workspaces_rect
                color: '#4700b3ff'

                implicitHeight: workspaces.implicitHeight
                implicitWidth: workspaces.implicitWidth

                anchors.centerIn: parent

                radius: workspace_viewer.rect_corner_radius

                Behavior on implicitWidth {
                    PropertyAnimation {
                        easing.type: Easing.BezierSpline
                    }
                }

                AllWorkspaces {
                    id: workspaces
                    height_model: workspace_viewer.height_model - 4
                    rect_corner_radius: workspace_viewer.rect_corner_radius
                }
            }
        }

        WindowNameViewer {
            height_model: workspace_viewer.height_model
        }
    }    
}