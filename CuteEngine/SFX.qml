import QtQuick 2.5
import QtMultimedia 5.5

CuteObject {
    readonly property string __className: "SFX"

    property alias source: _audio.source

    Audio {
        id: _audio
        autoLoad: true
        autoPlay: false
        onError: console.log(errorString)
    }
}

