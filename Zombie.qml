import QtQuick 2.4
import "CuteEngine"
import "var.js" as Var

NPC {
    id: self
    width: 32
    height: 32
    source: "qrc:/resources/zombie.png"
    intersect: true
    property string move
    property int __moveIndex: 0
    property bool __moveInc: true

    onIntersected: Var.gameOver()

    resources: [
        Timer {
            running: true
            repeat: true
            interval: 200
            onTriggered: {
                var it
                if (__moveInc)
                    it = move[__moveIndex++]
                else {
                    it = move[__moveIndex--]
                    switch (it) {
                        case "u": case "U": it = "d"; break
                        case "d": case "D": it = "u"; break
                        case "l": case "L": it = "r"; break
                        case "r": case "R": it = "l"; break
                    }
                }
                switch (it) {
                    case "u": case "U": moveUp(); break
                    case "d": case "D": moveDown(); break
                    case "l": case "L": moveLeft(); break
                    case "r": case "R": moveRight(); break
                }
                if (__moveIndex >= move.length) {
                    __moveIndex = move.length - 1
                    __moveInc = false
                }
                else if (__moveIndex < 0) {
                    __moveIndex = 0
                    __moveInc = true
                }
            }
        }
    ]

    // Idle
    Sprite {
        name: "downIdle"
        frameX: 32
        frameY: 0
        frameCount: 1
        frameWidth: 32
        frameHeight: 32
        frameDuration: 100
    }
    Sprite {
        name: "leftIdle"
        frameX: 32
        frameY: 32
        frameCount: 1
        frameWidth: 32
        frameHeight: 32
        frameDuration: 100
    }
    Sprite {
        name: "rightIdle"
        frameX: 32
        frameY: 64
        frameCount: 1
        frameWidth: 32
        frameHeight: 32
        frameDuration: 100
    }
    Sprite {
        name: "upIdle"
        frameX: 32
        frameY: 96
        frameCount: 1
        frameWidth: 32
        frameHeight: 32
        frameDuration: 100
    }
    // move
    Sprite {
        name: "down"
        frameX: 0
        frameY: 0
        frameCount: 3
        frameWidth: 32
        frameHeight: 32
        frameDuration: 100
        to: {"downIdle":1}
    }
    Sprite {
        name: "left"
        frameX: 0
        frameY: 32
        frameCount: 3
        frameWidth: 32
        frameHeight: 32
        frameDuration: 100
        to: {"leftIdle":1}
    }
    Sprite {
        name: "right"
        frameX: 0
        frameY: 64
        frameCount: 3
        frameWidth: 32
        frameHeight: 32
        frameDuration: 100
        to: {"rightIdle":1}
    }
    Sprite {
        name: "up"
        frameX: 0
        frameY: 96
        frameCount: 3
        frameWidth: 32
        frameHeight: 32
        frameDuration: 100
        to: {"upIdle":1}
    }

    function moveUp() { jumpTo("up"); --blockY; Var.currentMap.resetNPC() }
    function moveDown() { jumpTo("down"); ++blockY; Var.currentMap.resetNPC() }
    function moveLeft() { jumpTo("left"); --blockX; Var.currentMap.resetNPC()}
    function moveRight() { jumpTo("right"); ++blockX; Var.currentMap.resetNPC() }
}

