import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
    id: root

    required property int height_model
    property string battery_color: "white"
    property int battery_width: 30
    property bool has_battery: false
    property string percentage: "00%"
    property bool charging: false

    implicitHeight: height_model
    implicitWidth: battery.implicitWidth

    color: "transparent"

    visible: has_battery

    function reduce(value, percentage) {
        return value - value * percentage / 100
    }

    function battery_state_color() {
        if(charging)
            return '#00ff1a'
        else
            return battery_color
    }

    function battery_percentage_number() {
        if(has_battery) {
            return Number(percentage.slice(0, percentage.length - 1))
        }
    }

    RowLayout {
        id: battery

        anchors.centerIn: parent

        visible: root.has_battery

        Text {
            text: root.percentage
            color: root.battery_color
            font.pixelSize: root.reduce(root.implicitHeight, 56)
        }

        Rectangle {
            implicitHeight: root.reduce(root.implicitHeight, 50)
            implicitWidth: root.battery_width

            color: "transparent"

            border {
                width: 2
                color: root.battery_color
            }

            Rectangle {
                implicitHeight: root.reduce(parent.implicitHeight, 46)
                implicitWidth: root.reduce(parent.implicitWidth, 32)

                anchors.centerIn: parent

                color: "transparent"

                Rectangle {
                    implicitHeight: parent.implicitHeight
                    implicitWidth: parent.implicitWidth * root.battery_percentage_number() / 100

                    color: root.battery_state_color()
                }
            }
        }

        Rectangle {
            implicitHeight: root.reduce(root.implicitHeight, 80)
            implicitWidth: root.reduce(root.implicitWidth, 98)
            
            color: root.battery_color
        }
    }

    Process {
        id: i_have_battery
        command: ["fish", "-c", "i_have_battery"]
        running: false
        stdout: StdioCollector {
            onStreamFinished: {
                if(this.text.trim().toString() == "yes")
                    root.has_battery = true
                else
                    root.has_battery = false
            }
        }
    }

    Timer {
        interval: 1
        running: true
        repeat: false
        onTriggered: i_have_battery.running = true
    }

    Process {
        id: battery_percentage
        command: ["fish", "-c", "battery_percentage"]
        running: false
        stdout: StdioCollector {
            onStreamFinished: root.percentage = this.text.trim().toString()
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: battery_percentage.running = true
    }

    Process {
        id: battery_status
        command: ["fish", "-c", "battery_charge_state"]
        running: false
        stdout: StdioCollector {
            onStreamFinished: {
                if(this.text.trim().toString() == "Charging")
                    root.charging = true
                else 
                    root.charging = false
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: battery_status.running = true
    }
}