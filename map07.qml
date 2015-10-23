import QtQuick 2.5
import "CuteEngine"
import "var.js" as Var

Map {
    id: map
    source: "qrc:/resources/map07.png"
    row: 23
    col: 22
    player: Char { }

    BGM { source: "qrc:/resources/bgm03.mp3" }

    mapWarps: [
        MapWarp {
            blockX: 11; blockY: 5; receiver: "map"; message: "map06";
            onActivated: { Var.wrapToX = 10; Var.wrapToY = 5 }
        }
    ]

    mapItems: [
        ChatItem {
            blockX: 16; blockY: 8; pic: false
            text: [
                "Today is Birthday.\nAgain and again.",
                "Hope you're having an\nawesome day!\n",
                "It's a gift to you.\n3690"
            ]
            onIndexChanged: {
                if (index == 3) Var.knowCode = true
            }
        },
        ChatItem {
            blockX: 5; blockY: 8; pic: false
            text: [
                "You should get out here. \nIt's too dangerous."]
        },
        ChatItem {
            blockX: 14; blockY: 13; pic: false
            text: [
                "Control Tutorial",
                "\n<--Look this",
                " < = Go Laft \n > = Go Right \n ^ = Go Up \n v = Go Down",
                "\nLook this-->",
                " A = Accept,Investigate \n B = Cancel,Back"
            ]
        },
        ChatItem {
            blockX: 15; blockY: 13; pic: false
            text: [
                "Control Tutorial",
                "\n<--Look this",
                " < = Go Laft \n > = Go Right \n ^ = Go Up \n v = Go Down",
                "\nLook this-->",
                " A = Accept,Investigate \n B = Cancel,Back"
            ]
        }
    ]

    mapProperty: [
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,0,9,9,9,9,0,2,1,9,9,9,9,0,9,9,9,9],
        [9,9,9,9,9,0,0,0,0,9,0,0,0,9,0,0,0,0,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,9,9,9,9],
        [9,9,9,0,0,9,0,0,0,9,0,0,0,9,0,0,9,0,0,9,9,9],
        [9,9,9,0,0,0,0,9,9,9,0,0,0,9,0,0,0,0,0,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,0,0,0,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,0,0,0,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,0,0,0,9,9,9,9,9,9,9,9,9],
        [9,9,9,0,9,9,9,0,0,9,0,0,0,9,9,9,9,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,9,0,0,0,9,0,0,0,0,0,9,9,9],
        [9,9,9,0,9,9,9,0,0,0,0,0,0,0,0,0,9,0,0,9,9,9],
        [9,9,9,0,0,0,0,0,0,9,0,0,0,9,0,0,9,0,0,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,0,0,0,9,0,0,0,0,0,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
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
