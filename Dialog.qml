import QtQuick 2.4
import "CuteEngine"
import "var.js" as Var

CuteObject {
    height: 211
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    clip: true
    property alias text: _text
    property alias rect: _rect
    property var close
    property bool ok: false
    property bool pic: false

    onVisibleChanged: {
        if (visible == false && close) close()
    }

    Image {
        id: _rect
        anchors.fill: parent
        source: pic ? "qrc:/resources/textbox2.png" : "qrc:/resources/textbox1.png"
    }

    Item {
        anchors.centerIn: parent
        width: 350
        height: 150
        Text {
            id: _text
            font.pixelSize: 28
            anchors.fill: parent
        }
    }
}

