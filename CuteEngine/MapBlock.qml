import QtQuick 2.5

Item {
    clip: true

    property alias source: _img.source
    property alias imageX: _img.x
    property alias imageY: _img.y
    property alias imageWidth: _img.width
    property alias imageHeight: _img.height
    property alias imageImplicitWidth: _img.implicitWidth
    property alias imageImplicitHeight: _img.implicitHeight
    property alias imageScale: _img.scale

    Image {
        id: _img
        cache: true
        fillMode: Image.Stretch
        //width: implicitWidth
        //height: implicitHeight
    }
}

