import QtQuick 2.4
import "CuteEngine"
import "var.js" as Var

Page {
    BGM { source: "qrc:/resources/bgm06.mp3" }

    property int state: 0
    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Text {
        id: text
        anchors.centerIn: parent
        text: "It's not over..."
        font.pixelSize: 50
        color: "white"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (state == 0) text.text = "just beginning..."
            else if (state == 1) text.text = "The End"
            else send("game", "title")
            ++state
        }
    }
}

