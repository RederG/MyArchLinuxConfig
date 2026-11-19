import QtQuick

Row {
    id: workspaces
    spacing: 5

    required property int height_model

    WorkspaceButton {
        workspace_id: 0
        height_model: workspaces.height_model
    }

    WorkspaceButton {
        workspace_id: 1
        height_model: workspaces.height_model
    }

    WorkspaceButton {
        workspace_id: 2
        height_model: workspaces.height_model
    }

    WorkspaceButton {
        workspace_id: 3
        height_model: workspaces.height_model
    }

    WorkspaceButton {
        workspace_id: 4
        height_model: workspaces.height_model
    }

    WorkspaceButton {
        workspace_id: 5
        height_model: workspaces.height_model
    }

    WorkspaceButton {
        workspace_id: 6
        height_model: workspaces.height_model
    }

    WorkspaceButton {
        workspace_id: 7
        height_model: workspaces.height_model
    }

    WorkspaceButton {
        workspace_id: 8
        height_model: workspaces.height_model
    }
}