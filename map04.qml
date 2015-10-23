import QtQuick 2.5
import "CuteEngine"
import "var.js" as Var

Map {
    id: map
    source: "qrc:/resources/map04.png"
    row: 18
    col: 20
    player: Char { }

    BGM { source: "qrc:/resources/bgm03.mp3" }

    mapWarps: [
        MapWarp {
            blockX: 5; blockY: 16; receiver: "map"; message: "map09"
            onActivated: { Var.wrapToX = 9; Var.wrapToY = 25 }
        }
    ]

    mapItems: [
        GameItem {
            blockX: 14; blockY: 5; box: 2; iden: 15
            onActivated: Var.map04_item11 = false
            Component.onCompleted: if (!Var.map04_item11) destory()
        },
        GameItem {
            blockX: 16; blockY: 12; iden: Var.random(1, 7)
        },
        GameItem {
            blockX: 10; blockY: 10; iden: Var.random(13, 15)
        }
    ]

    npcs: [
        Zombie {
            blockX: 5; blockY: 7; move: "rrrrddddrrrrrrd"
        },
        Zombie {
            blockX: 3; blockY: 12; move: "uurdd"
        }
    ]

    mapProperty: [
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,0,0,0,9,9,0,0,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,9,0,0,0,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,9,9,9],
        [9,9,9,0,0,0,9,9,0,0,0,9,9,9,0,9,9,9,9,9],
        [9,9,9,0,0,0,9,9,0,0,0,9,9,9,0,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,9,9,9,0,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,9],
        [9,9,9,9,9,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9]
    ]

    Component.onCompleted: {
        Var.currentMap = this
        player.blockX = Var.wrapToX
        player.blockY = Var.wrapToY
        init()
    }
}

