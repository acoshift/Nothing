import QtQuick 2.4
import "CuteEngine"
import "var.js" as Var

Map {
    id: map
    source: "qrc:/resources/map05.png"
    row: 17
    col: 19
    player: Char { }

    BGM { source: "qrc:/resources/bgm03.mp3" }

    mapWarps: [
        MapWarp {
            blockX: 13; blockY: 15; receiver: "map"; message: "map09"
            onActivated: { Var.wrapToX = 15; Var.wrapToY = 22 }
        }
    ]

    mapItems: [
        GameItem {
            blockX: 13; blockY: 6; iden: Var.random(1,13)
        },
        GameItem {
            blockX: 4; blockY: 6; box: 2; iden: 10
            onActivated: Var.map04_item11 = false
            Component.onCompleted: if (!Var.map04_item11) destory()
        },
        GameItem {
            blockX: 7; blockY: 11; iden: Var.randomInArray([13,14])
        }
    ]

    npcs: [
        Zombie {
            blockX: 3; blockY: 10; move: "urrrrruuu"
        },
        Zombie {
            blockX: 9; blockY: 7; move: "rrr"
        },
        Zombie {
            blockX: 13; blockY: 12; move: "urruuuuu"
        }
    ]

    mapProperty: [
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,0,9,9,0,0,0,0,9,9,0,0,0,9,9,9],
        [9,9,9,9,0,9,9,0,0,0,0,0,0,0,0,0,9,9,9],
        [9,9,9,0,0,0,9,0,0,0,0,0,0,0,0,0,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,9,9,0,0,0,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,9],
        [9,9,9,9,9,9,9,0,0,0,0,0,0,0,0,0,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,0,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,0,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,0,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,0,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9]
    ]

    Component.onCompleted: {
        Var.currentMap = this
        player.blockX = Var.wrapToX
        player.blockY = Var.wrapToY
        init()
    }
}

