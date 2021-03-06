import QtQuick 2.5
import "CuteEngine"
import "var.js" as Var

Map {
    id: map
    source: "qrc:/resources/map09.png"
    row: 46
    col: 47
    player: Char { }

    BGM { source: "qrc:/resources/bgm03.mp3" }

    mapItems: [
        MapItem {
            blockX: 43; blockY: 35
            onActivated: {
                Var.wrapToX = 13; Var.wrapToY = 15
                send("map", "map08")
            }
        },
        MapItem {
            blockX: 25; blockY: 17
            onActivated: {
                Var.wrapToX = 9; Var.wrapToY = 18
                send("map", "map02")
            }
        },
        GameItem {
            blockX: 15; blockY: 12; iden: Var.random(1,13)
        },
        GameItem {
            blockX: 7; blockY: 40; iden: Var.randomInArray([13,15])
        },
        GameItem {
            blockX: 15; blockY: 25; iden: Var.random(13,15)
        },
        GameItem {
            blockX: 15; blockY: 42; box: 2; iden: 15
            onActivated: Var.map04_item11 = false
            Component.onCompleted: if (!Var.map04_item11) destory()
        },
        GameItem {
            blockX: 23; blockY: 8; iden: Var.random(1,13)
        },
        GameItem {
            blockX: 26; blockY: 21; iden: Var.random(1,13)
        },
        GameItem {
            blockX: 32; blockY: 32; iden: Var.random(13,15)
        },
        GameItem {
            blockX: 31; blockY: 38; box: 2; iden: 15
            onActivated: Var.map04_item11 = false
            Component.onCompleted: if (!Var.map04_item11) destory()
        },
        GameItem {
            blockX: 32; blockY: 7; box: 2; iden: 15
            onActivated: Var.map04_item11 = false
            Component.onCompleted: if (!Var.map04_item11) destory()
        },
        GameItem {
            blockX: 43; blockY: 21; iden: Var.random(1,13)
        }
    ]

    mapWarps: [
        MapWarp {
            blockX: 9; blockY: 12; receiver: "map"; message: "map06"
            onActivated: { Var.wrapToX = 5; Var.wrapToY = 19 }
        },
        MapWarp {
            blockX: 9; blockY: 24; receiver: "map"; message: "map04"
            onActivated: { Var.wrapToX = 5; Var.wrapToY = 15 }
        },
        MapWarp {
            blockX: 15; blockY: 21; receiver: "map"; message: "map05"
            onActivated: { Var.wrapToX = 13; Var.wrapToY = 14 }
        },
        MapWarp {
            blockX: 19; blockY: 39; receiver: "map"; message: "map03"
            onActivated: { Var.wrapToX = 1; Var.wrapToY = 43 }
        }
    ]

    npcs: [
        Zombie {
            blockX: 7; blockY: 15; move: "rrrrrrrrrr"
        },
        Zombie {
            blockX: 24; blockY: 16; move: "rrddlluu"
        },
        Zombie {
            blockX: 9; blockY: 17; move: "rrrrdddllllluuu"
        },
        Zombie {
            blockX: 4; blockY: 10; move: "dddddddddluu"
        },
        Zombie {
            blockX: 5; blockY: 21; move: "ddddd"
        },
        Zombie {
            blockX: 9; blockY: 17; move: "rrrrdddllllluuu"
        },
        Zombie {
            blockX: 14; blockY: 29; move: "llluuuulll"
        },
        Zombie {
            blockX: 13; blockY: 31; move: "lldddrdddllllddl"
        },
        Zombie {
            blockX: 16; blockY: 37; move: "dllllldddddrruuurur"
        },
        Zombie {
            blockX: 21; blockY: 10; move: "dddddddd"
        },
        Zombie {
            blockX: 24; blockY: 22; move: "dlllllldd"
        },
        Zombie {
            blockX: 16; blockY: 27; move: "rrrdddddrrrruuuulll"
        },
        Zombie {
            blockX: 24; blockY: 14; move: "urrruurruuuuurr"
        },
        Zombie {
            blockX: 34; blockY: 8; move: "rrdrdddddrrrrulu"
        },
        Zombie {
            blockX: 33; blockY: 14; move: "rrrdllddlddd"
        },
        Zombie {
            blockX: 42; blockY: 15; move: "dddldllllurrr"
        },
        Zombie {
            blockX: 30; blockY: 18; move: "dddddddl"
        },
        Zombie {
            blockX: 38; blockY: 24; move: "lddddddlllllll"
        },
        Zombie {
            blockX: 41; blockY: 31; move: "dddddddllddllluul"
        }
    ]

    mapProperty: [
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,0,0,0,0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,0,0,9,9,9,0,0,9,9,9,9,9,9,9,9,9,9,0,0,0,0,0,9,0,9,9,9,9,0,0,0,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,0,9,9,9,9,9,0,9,0,9,9,9,9,9,9,9,0,0,0,0,0,9,9,0,9,9,9,9,0,0,0,0,0,9,9,9,9,9,9,9,9],
        [9,9,9,9,0,9,0,9,9,9,9,9,0,9,0,9,9,9,9,9,9,0,9,9,9,9,0,9,0,0,9,9,9,9,0,9,9,0,0,9,9,9,9,9,9,9,9],
        [9,9,9,9,0,9,0,9,9,9,9,9,0,9,0,9,9,9,9,9,9,0,9,9,9,9,0,0,0,0,0,0,9,9,9,9,9,0,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,0,9,0,9,9,0,9,9,0,9,0,0,9,9,9,9,9,0,9,9,9,9,0,0,0,0,0,0,0,0,0,0,0,0,9,9,0,9,9,9,9,9,9],
        [9,9,9,9,0,9,0,0,0,0,0,0,0,9,0,9,9,0,9,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,9,9,9],
        [9,9,9,9,0,9,9,9,9,0,9,9,9,9,0,9,0,0,9,0,0,0,0,0,0,0,0,0,0,9,9,9,9,0,0,0,0,0,0,0,0,0,9,9,9,9,9],
        [9,9,9,9,0,0,9,0,0,0,0,0,0,0,0,0,0,0,9,9,9,0,0,0,0,0,0,0,9,9,9,9,9,9,0,0,0,9,9,9,9,0,0,9,9,9,9],
        [9,9,9,9,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,9,9,9,9,0,0,0,9,9,9,9,0,0,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,9,0,0,0,0,9,9,9,0,0,0,0,9,9,9,9,0,0,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,9,9,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,9],
        [9,9,9,0,0,0,9,9,0,9,9,0,0,0,9,9,9,9,0,0,9,9,0,0,9,9,9,9,9,9,0,0,9,0,0,0,0,0,0,0,0,0,9,9,9,9,9],
        [9,9,9,9,0,0,9,9,0,0,0,0,0,0,9,9,9,9,0,0,9,9,9,9,9,9,9,9,9,9,0,0,9,0,0,0,0,0,0,0,0,0,9,9,9,9,9],
        [9,9,9,9,0,0,9,9,9,9,9,0,0,0,9,0,9,9,0,9,9,9,0,9,9,9,0,9,9,9,0,0,0,0,0,0,0,9,9,0,0,0,0,0,9,9,9],
        [9,9,9,9,0,0,9,9,9,9,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0,9,9,0,0,0,0,0,9,9,9],
        [9,9,9,9,0,0,9,9,9,9,9,0,0,0,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,9,0,0,0,9,0,0,0,0,9,9,9],
        [9,9,9,0,0,0,9,9,9,0,9,0,0,0,9,9,9,9,0,0,0,0,0,0,0,9,0,0,9,0,0,0,0,0,9,9,0,0,0,9,0,0,9,9,9,9,9],
        [9,9,9,0,0,0,0,0,0,0,0,0,0,0,9,0,9,9,0,9,0,9,9,9,0,9,9,0,9,0,0,9,9,9,9,9,9,0,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,0,0,0,0,0,0,0,0,0,9,9,0,0,0,0,9,0,9,9,9,0,0,9,0,0,9,9,9,9,9,9,9,9,0,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,0,0,0,9,0,0,0,9,9,0,0,0,0,0,0,9,9,9,0,0,9,0,9,9,9,9,9,9,9,9,9,0,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,0,0,9,0,0,0,0,0,0,9,9,9,0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,0,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,0,0,0,0,0,0,0,9,9,9,0,9,9,9,0,9,9,9,9,9,9,9,9,9,0,0,9,0,0,0,0,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,0,9,9,0,9,9,9,0,9,9,9,0,0,0,9,9,9,9,0,0,0,0,0,0,0,0,0,0,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,0,0,0,9,0,0,0,0,0,9,9,9,0,0,9,9,9,9,9,9,9,0,0,9,9,9,9,9,0,0,0,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,0,0,9,9,0,0,0,0,0,0,0,0,0,0,9,9,9,9,9,9,9,0,9,9,9,9,9,9,9,0,0,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,0,0,9,9,9,9,0,0,9,0,0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,0,0,9,9,9,9,9,0,9,0,9,9,9,9,9,9,9,9,0,9,9,9,9,9,9,9,9,9,9,9,0,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,9,9,9,9,9,9,9,9,9,9,0,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,0,0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,9,0,9,9,9,9,9,9,9,0,0,0,0,9,9,9],
        [9,9,9,9,9,9,9,9,0,0,0,0,0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,9,9,9,9,9,9,0,0,0,0,9,9,9,9],
        [9,9,9,9,9,9,9,0,0,9,9,0,0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,9,9,0,0,0,9,0,0,0,0,9,9,9,9],
        [9,9,9,9,9,9,9,0,0,9,9,0,0,0,0,0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,0,0,0,0,0,0,9,0,0,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,0,9,0,0,0,0,0,0,9,9,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,0,0,0,0,0,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,0,0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,0,0,0,0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,0,0,0,0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],
        [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9]
    ]

    Component.onCompleted: {
        Var.currentMap = this
        player.blockX = Var.wrapToX
        player.blockY = Var.wrapToY
        init()
    }

}

