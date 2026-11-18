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
                required property var modelData

                color: "transparent"

                screen: modelData
                
                anchors {
                    top: true
                    left: true
                    right: true
                }

                implicitHeight: 35

                TimeViewer.ClockViewer {
                    anchors.centerIn: parent
                    color: "#4700b3ff"     
                }

                WorkspaceManager.WorkspaceViewer {
                    
                }

                Multicontrol.MainBar {
                    anchors.right: parent.right
                }
            }
        }
    }
}