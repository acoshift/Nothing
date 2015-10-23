import QtQuick 2.4
import "CuteEngine"
import "var.js" as Var

CuteObject {
    width: 400
    height: 200
    anchors.centerIn: parent
    clip: true
    property alias image: _image
    property alias text: _text
    property alias rect: _rect
    property var close
    property bool ok: false
    property int itemIden: -1

    onVisibleChanged: {
        if (visible == false && close) close()
    }

    onItemIdenChanged: {
        _image.source = Var.itemSource(itemIden)
        _text.text = Var.itemText[itemIden - 1]
    }

    Image {
        id: _rect
        anchors.fill: parent
        source: "qrc:/resources/text.png"
    }

    Item {
        anchors.centerIn: parent
        width: 350
        height: 150
        Image {
            id: _image
            width: 100
            height: 100
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
            }
        }
        Text {
            id: _text
            font.pixelSize: 40
            anchors {
                top: _image.bottom
                horizontalCenter: parent.horizontalCenter
            }
        }
    }
}

