import QtQuick 2.4
import "CuteEngine"
import "var.js" as Var

Map {
    id: map
    source: "qrc:/resources/map06.png"
    row: 23
    col: 22
    player: Char { }

    BGM { source: "qrc:/resources/bgm03.mp3" }

    mapWarps: [
        MapWarp {
            blockX: 11; blockY: 5; receiver: "map"; message: "map07"
            onActivated: { Var.wrapToX = 12; Var.wrapToY = 5 }
        },
        MapWarp {
            blockX: 5; blockY: 20; receiver: "map"; message: "map09"
            onActivated: { Var.wrapToX = 9; Var.wrapToY = 13 }
        }
    ]

    mapItems: [
        GameItem {
            blockX: 18; blockY: 11; iden: Var.randomInArray([9,12,13,15])
        }
    ]

    mapProperty: [
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,0,9,9,9,9,1,2,0,9,9,9,9,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,9,0,0,0,9,0,0,0,0,0,9,9,9],
        [9,9,9,9,0,9,9,9,9,9,0,0,0,9,9,9,0,9,9,9,9,9],
        [9,9,9,9,0,9,9,9,9,9,0,0,0,9,9,9,0,9,9,9,9,9],
        [9,9,9,9,0,9,9,9,9,9,0,0,0,9,9,9,0,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,0,0,9,9,9,0,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,0,0,9,9,9,0,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,9,9,9,0,0,9,9,9,0,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,9,9,9,0,0,9,9,9,0,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,0,0,9,9,9,0,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,9,9,9],
        [9,9,9,9,9,0,9,9,9,9,0,0,0,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9]
    ]

    Component.onCompleted: {
        Var.currentMap = this
        player.blockX = Var.wrapToX
        player.blockY = Var.wrapToY
        init()
    }
}

