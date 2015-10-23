import QtQuick 2.4
import "CuteEngine"
import "var.js" as Var

Map {
    id: map
    source: "qrc:/resources/map02.png"
    row: 20
    col: 20
    player: Char { }

    BGM { source: "qrc:/resources/bgm04.mp3" }

    mapWarps: [
        MapWarp {
            blockX: 9; blockY: 17; receiver: "map"; message: "map09"
            onActivated: { Var.wrapToX = 25; Var.wrapToY = 16 }
        },
        MapWarp {
            blockX: 0; blockY: 2; receiver: "map"; message: "map01"
            onActivated: { Var.wrapToX = 1; Var.wrapToY = 27 }
        }
    ]

    mapItems: [
        ChatItem {
            blockX: 19; blockY: 2; pic: false
            text: ["Don't get out."]
        },
        ChatItem {
            blockX: 10; blockY: 18; pic: true
            text: [
                "Another skeleton.",
                "I don't want to die down here"]
        }

    ]

    mapProperty: [
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0],
        [0,9,0,0,0,9,0,0,0,0,0,9,0,0,9,0,0,0,0,0],
        [0,9,0,9,9,9,0,9,0,9,9,9,9,0,9,0,9,9,0,0],
        [0,9,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,9,9],
        [0,0,0,9,9,9,9,0,9,0,9,0,0,0,9,0,9,0,0,0],
        [9,9,9,0,0,0,0,0,0,0,0,9,0,0,9,0,0,0,0,9],
        [0,0,0,9,9,0,9,9,9,0,0,9,0,0,9,9,0,9,9,9],
        [0,0,0,0,0,9,0,0,0,9,9,0,9,0,9,0,0,0,0,0],
        [9,0,9,9,0,0,9,9,0,0,0,0,0,0,9,0,9,9,0,0],
        [0,0,0,0,0,9,0,0,9,9,9,9,9,0,0,0,0,9,9,0],
        [9,9,0,0,0,0,0,0,0,0,0,0,0,9,9,0,0,0,0,0],
        [0,9,0,9,9,9,0,9,0,9,9,9,0,0,0,9,9,9,0,9],
        [0,0,0,0,0,9,0,9,0,0,0,0,0,9,0,9,0,0,0,0],
        [0,0,9,9,0,9,0,0,9,9,9,9,0,9,0,0,0,0,0,0],
        [0,9,0,9,0,9,0,9,9,9,9,9,0,9,0,9,9,0,9,9],
        [0,9,0,0,0,0,0,0,9,0,9,9,0,0,0,0,0,9,0,0],
        [9,9,9,9,9,9,9,0,9,0,9,9,9,9,9,9,0,9,0,9],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9]
    ]

    Component.onCompleted: {
        Var.currentMap = this
        player.blockX = Var.wrapToX
        player.blockY = Var.wrapToY
        init()
    }
}

