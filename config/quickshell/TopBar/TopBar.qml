import Quickshell
import QtQuick

import "workspace_manager" as WorkspaceManager
import "time_viewer" as TimeViewer
import "multi_control" as Multicontrol

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        delegate: Component {
            PanelWindow {
                id: top_bar

                property real rect_corner_radius: 16.0
                property int rect_border_width: 2

                required property var modelData

                color: "transparent"

                screen: modelData
                
                anchors {
                    top: true
                    left: true
                    right: true
                }

                implicitHeight: 34

                TimeViewer.ClockViewer {
                    height_model: top_bar.implicitHeight 
                    anchors.centerIn: parent
                    color: "#4700b3ff"
                    rect_corner_radius: top_bar.rect_corner_radius
                }

                WorkspaceManager.WorkspaceViewer {
                    anchors.left: parent.left
                    height_model: top_bar.implicitHeight
                    rect_corner_radius: top_bar.rect_corner_radius
                    rect_border_width: top_bar.rect_border_width
                }

                Multicontrol.MultiControl {
                    anchors.right: parent.right
                    height_model: top_bar.implicitHeight
                    rect_corner_radius: top_bar.rect_corner_radius
                    rect_border_width: top_bar.rect_border_width
                }
            }
        }
    }
}