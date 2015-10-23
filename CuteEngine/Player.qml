import QtQuick 2.5

CuteObject {
    id: self
    readonly property string __className: "Player"
    property string source: ""
    property int blockX: 0
    property int blockY: 0
    property list<Sprite> __sprites
    default property alias sprites: self.__sprites
    property alias running: _seq.running
    property alias interpolate: _seq.interpolate
    property alias current: _seq.currentSprite

    function jumpTo(sprite) {
        _seq.jumpTo(sprite)
    }

    SpriteSequence {
        id: _seq
        anchors.fill: parent
        interpolate: false
    }

    onSpritesChanged: __reset()

    function __reset() {
        for (var i = 0; i < sprites.length; ++i) {
            if (sprites[i].source == "") sprites[i].source = self.source
        }
        _seq.sprites = sprites
    }

    property alias moveX: _moveX
    property alias moveY: _moveY
    NumberAnimation on x { id: _moveX; duration: 200; onToChanged: start() }
    NumberAnimation on y { id: _moveY; duration: 200; onToChanged: start() }
}

