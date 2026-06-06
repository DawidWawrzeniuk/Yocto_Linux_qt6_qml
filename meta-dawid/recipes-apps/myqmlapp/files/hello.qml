import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 480
    height: 320
    title: "RPi5 Dashboard UI"

    // 🌈 ANIMOWANE TŁO
    Rectangle {
        id: bg
        anchors.fill: parent

        gradient: Gradient {
            GradientStop { id: g1; position: 0.0; color: "#0f2027" }
            GradientStop { id: g2; position: 0.5; color: "#203a43" }
            GradientStop { id: g3; position: 1.0; color: "#2c5364" }
        }

        SequentialAnimation on opacity {
            loops: Animation.Infinite
            NumberAnimation { to: 0.85; duration: 3000 }
            NumberAnimation { to: 1.0; duration: 3000 }
        }
    }

    // 🔵 GLOW-STYLE HEADER (bez glow lib)
    Text {
        text: "Raspberry Pi 5 CONTROL PANEL"
        color: "#00ffcc"
        font.pixelSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20

        opacity: 0
        scale: 0.8

        SequentialAnimation {
            running: true
            NumberAnimation { target: parent; property: "opacity"; to: 1; duration: 1000 }
            NumberAnimation { target: parent; property: "scale"; to: 1.0; duration: 600 }
        }
    }

    // 📦 CENTRAL CARD (fake panel UI)
    Rectangle {
        id: card
        width: 360
        height: 160
        radius: 16
        anchors.centerIn: parent
        color: "#1c1f26"
        border.color: "#2f3b4a"
        border.width: 1

        scale: 0.8
        opacity: 0

        SequentialAnimation {
            running: true
            NumberAnimation { target: card; property: "opacity"; to: 1; duration: 900 }
            NumberAnimation { target: card; property: "scale"; to: 1.0; duration: 500 }
        }

        // 📊 STATUS TEXT
        Text {
            text: "SYSTEM STATUS"
            color: "#aaaaaa"
            font.pixelSize: 14
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "Yocto Linux Running"
            color: "#00ffcc"
            font.pixelSize: 20
            anchors.centerIn: parent
        }

        // 🔴 PULSING LED
        Rectangle {
            id: led
            width: 14
            height: 14
            radius: 7
            color: "#00ff66"
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20

            SequentialAnimation on opacity {
                loops: Animation.Infinite
                NumberAnimation { to: 0.2; duration: 600 }
                NumberAnimation { to: 1.0; duration: 600 }
            }
        }
    }

    // 🔘 BUTTON PANEL
    Button {
        text: "Restart Service"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20

        onClicked: {
            console.log("Service restart triggered 🚀")
        }
    }

    // ⏱ FAKE CLOCK / LIVE UPDATE
    property int counter: 0

    Text {
        id: counterText
        text: "Runtime: " + counter + " s"
        color: "#888"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 10
        font.pixelSize: 12
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: counter++
    }
}
