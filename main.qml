import "CuteEngine"
import Qt.labs.settings 1.0
import "var.js" as Var

Game {
    name: "game"
    title: "Nothing"
    gameWidth: 1280
    gameHeight: 720

    Source { name: "title"; source: "qrc:/title.qml" }
    Source { name: "play"; source: "qrc:/play.qml" }
    Source { name: "end"; source: "qrc:/end.qml" }

    state: "title"

    transitors: [
        Transitor { name: "title"; next: "play"; message: "play" },
        Transitor { name: "play"; next: "end"; message: "end" },
        Transitor { name: "play"; next: "title"; message: "title" },
        Transitor { name: "end"; next: "title"; message: "title" }
    ]

    settings: Settings {
        property bool saved: false
        property string mapState
        property int wrapToX
        property int wrapToY
        property var inventory
        property int currentKey
        property int fullness
        property int infection
        property bool map04_item11
        property bool knowCode
    }

    onCompleted: {
        Var.game = this
        Var.settings = settings
    }
}
