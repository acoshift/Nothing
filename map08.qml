import QtQuick 2.5
import "CuteEngine"
import "var.js" as Var

Map {
    id: map
    source: "qrc:/resources/map08.png"
    row: 18
    col: 19
    player: Char { }

    BGM { source: "qrc:/resources/bgm03.mp3" }

    mapWarps: [
        MapWarp {
            blockX: 13; blockY: 16; receiver: "map"; message: "map09"
            onActivated: { Var.wrapToX = 43; Var.wrapToY = 36 }
        }
    ]

    mapItems: [
        ChatItem {
            blockX: 7; blockY: 10; pic: true
            text: ["Difficult too Read."]
        },
        ChatItem {
            blockX: 8; blockY: 10; pic: true
            text: ["Difficult too Read."]
        },
        ChatItem {
            blockX: 9; blockY: 10; pic: true
            text: ["Difficult too Read."]
        },
        ChatItem {
            blockX: 10; blockY: 10; pic: true
            text: ["Difficult too Read."]
        },
        ChatItem {
            blockX: 5; blockY: 10; pic: false
            text: ["I want to exit here.\nI must go to The Bonfire."]
        },
        GameItem {
            blockX: 7; blockY: 6; box: 2; iden: 15
            onActivated: Var.map04_item11 = false
            Component.onCompleted: if (!Var.map04_item11) destory()
        },
        GameItem {
            blockX: 3; blockY: 9; iden: Var.randomInArray([13,14,15])
        },
        GameItem {
            blockX: 15; blockY: 7; iden: Var.randomInArray([13,14,15])
        }
    ]

    npcs: [
        Zombie {
            blockX: 11; blockY: 10; move: "rrr"
        }
    ]

    mapProperty: [
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,0,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,0,0,0,0,0,0,0,0,0,9,9,9],
        [9,9,9,9,0,9,9,9,9,9,0,0,0,0,0,0,9,9,9],
        [9,9,9,9,0,0,9,9,9,9,0,0,0,9,9,0,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,0,0,9,9,0,9,9,9],
        [9,9,9,0,0,9,9,9,9,9,9,0,0,0,0,0,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,0,0,0,0,0,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,0,0,0,0,0,9,9,9],
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

