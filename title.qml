import QtQuick 2.5
import "CuteEngine"
import "var.js" as Var

Page {
    BGM {
        source: "qrc:/resources/bgm02.mp3"
    }
    Background {
        source: "qrc:/resources/title.png"
    }

    Button {
        x: 660
        y: 180
        scale: 0.8
        source: "qrc:/resources/btn01.png"
        onClicked: { Var.reset(); send("game", "play") }
    }

    Button {
        x: 660
        y: 320
        scale: 0.8
        source: settings.saved ? "qrc:/resources/btn02.png" : "qrc:/resources/btn03.png"
        onClicked: { Var.reset(); send("game", "play"); Var.load() }
    }

    Button {
        x: 660
        y: 460
        scale: 0.8
        source: "qrc:/resources/btn04.png"
        onClicked: Qt.quit()
    }
}

