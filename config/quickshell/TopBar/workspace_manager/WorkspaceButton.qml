import Quickshell.Hyprland
import QtQuick
import QtQuick.Controls

Item {
    required property int workspace_id

    readonly property int workspace_button_height: 30
    readonly property int workspace_button_width: 60
    readonly property int workspace_button_width_no_active: 30
    readonly property string active_workspace_color: '#ab0084ff' // '#005eff'
    readonly property string not_active_workspace_color: "transparent"

    implicitHeight: workspace_button_height
    implicitWidth: workspace_button_width

    Button {
        id: button
        text: parent.workspace_id + 1
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 16

        property string background_color: parent.not_active_workspace_color
        property string text_color: "transparent"

        palette.buttonText: text_color

        implicitHeight: parent.implicitHeight
        implicitWidth: parent.implicitWidth

        background: Rectangle {
            color: button.background_color
            radius: 16.0
            // transitions: Transition {
            //     PropertyAnimation {
            //         property: "width"
            //         easing.type: Easing.InQuart
            //     }
            // }
        }

        Behavior on implicitWidth {
            PropertyAnimation {
                easing.type: Easing.Bezier
                duration: 250
            }
        }

        Behavior on x {
            PropertyAnimation {
                easing.type: Easing.Bezier
                duration: 250
            }
        }

        onClicked: {
            Hyprland.dispatch("hl.dsp.focus({ workspace = " + (parent.workspace_id + 1) + " })")
        }
    }

    Timer {
        interval: 100
        repeat: true
        running: true

        onTriggered: {
            let workspace_max_id = 0
            let index = 0
            let found = false

            for(let i = 0; i < Hyprland.workspaces.values.length; i++) {
                let workspace = Hyprland.workspaces.values[i]
                if(workspace_max_id < workspace.id) {
                    workspace_max_id = workspace.id
                }
                if(workspace.id == (parent.workspace_id + 1)) {
                    index = i
                    found = true
                }
            }
            if(found) {
                if(Hyprland.workspaces.values[index].active) {
                    button.background_color = parent.active_workspace_color
                    button.text_color = "white"
                    button.implicitHeight = parent.workspace_button_height
                    button.implicitWidth = parent.workspace_button_width
                    parent.implicitHeight = parent.workspace_button_height
                    parent.implicitWidth = parent.workspace_button_width
                } else {
                    button.background_color = parent.not_active_workspace_color
                    button.text_color = "white"
                    button.implicitHeight = parent.workspace_button_height
                    button.implicitWidth = parent.workspace_button_width_no_active
                    parent.implicitHeight = parent.workspace_button_height
                    parent.implicitWidth = parent.workspace_button_width_no_active
                }
            } else if((parent.workspace_id + 1) <= workspace_max_id) {
                button.background_color = parent.not_active_workspace_color
                button.text_color = "white"
                button.implicitHeight = parent.workspace_button_height
                button.implicitWidth = parent.workspace_button_width_no_active
                parent.implicitHeight = parent.workspace_button_height
                parent.implicitWidth = parent.workspace_button_width_no_active
            } else {
                button.implicitHeight = 0
                button.implicitWidth = 0
                parent.implicitHeight = 0
                parent.implicitWidth = 0
            }
        }
    }
}