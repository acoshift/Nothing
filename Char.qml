import QtQuick 2.5
import "CuteEngine"
import "var.js" as Var

Player {
    id: self
    width: 32
    height: 32
    source: "qrc:/resources/char.png"
    moveX.duration: 250
    moveY.duration: 250

    // Idle
    Sprite {
        name: "downIdle"
        frameX: 32
        frameY: 0
        frameCount: 1
        frameWidth: 32
        frameHeight: 32
        frameDuration: 1000
    }
    Sprite {
        name: "leftIdle"
        frameX: 32
        frameY: 32
        frameCount: 1
        frameWidth: 32
        frameHeight: 32
        frameDuration: 1000
    }
    Sprite {
        name: "rightIdle"
        frameX: 32
        frameY: 64
        frameCount: 1
        frameWidth: 32
        frameHeight: 32
        frameDuration: 1000
    }
    Sprite {
        name: "upIdle"
        frameX: 32
        frameY: 96
        frameCount: 1
        frameWidth: 32
        frameHeight: 32
        frameDuration: 1000
    }
    // move
    Sprite {
        name: "down"
        frameX: 0
        frameY: 0
        frameCount: 3
        frameWidth: 32
        frameHeight: 32
        frameDuration: 120
    }
    Sprite {
        name: "left"
        frameX: 0
        frameY: 32
        frameCount: 3
        frameWidth: 32
        frameHeight: 32
        frameDuration: 120
    }
    Sprite {
        name: "right"
        frameX: 0
        frameY: 64
        frameCount: 3
        frameWidth: 32
        frameHeight: 32
        frameDuration: 120
    }
    Sprite {
        name: "up"
        frameX: 0
        frameY: 96
        frameCount: 3
        frameWidth: 32
        frameHeight: 32
        frameDuration: 120
    }

    Component.onCompleted: Var.currentChar = this

    moveX.onStarted: jumpTo(direction)
    moveX.onStopped: jumpTo(direction + "Idle")
    moveY.onStarted: jumpTo(direction)
    moveY.onStopped: jumpTo(direction + "Idle")

    property int _itemX: -1
    property int _itemY: -1
    property string direction: "down"

    function isRunning() {
        return moveX.running || moveY.running
    }

    function moveUp() { direction = "up"; if (!Var.currentMap.playerMoveUp()) jumpTo(direction + "Idle"); _itemX = blockX; _itemY = blockY - 1 }
    function moveDown() { direction = "down"; if (!Var.currentMap.playerMoveDown()) jumpTo(direction + "Idle"); _itemX = blockX; _itemY = blockY + 1 }
    function moveLeft() { direction = "left"; if (!Var.currentMap.playerMoveLeft()) jumpTo(direction + "Idle"); _itemX = blockX - 1; _itemY = blockY }
    function moveRight() { direction = "right"; if (!Var.currentMap.playerMoveRight()) jumpTo(direction + "Idle"); _itemX = blockX + 1; _itemY = blockY }
}

