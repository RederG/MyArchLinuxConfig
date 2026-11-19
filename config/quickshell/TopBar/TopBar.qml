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

                required property var modelData

                color: "transparent"

                screen: modelData
                
                anchors {
                    top: true
                    left: true
                    right: true
                }

                implicitHeight: 30

                TimeViewer.ClockViewer {
                    height_model: top_bar.implicitHeight 
                    anchors.centerIn: parent
                    color: "#4700b3ff"
                }

                WorkspaceManager.WorkspaceViewer {
                    anchors.left: parent.left
                    height_model: top_bar.implicitHeight
                }

                Multicontrol.MultiControl {
                    anchors.right: parent.right
                    height_model: top_bar.implicitHeight
                }
            }
        }
    }
}