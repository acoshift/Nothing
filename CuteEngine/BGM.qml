import QtQuick 2.5
import QtMultimedia 5.5

CuteObject {
    readonly property string __className: "BGM"

    property alias source: _audio.source

    Audio {
        id: _audio
        autoLoad: true
        autoPlay: true
        loops: Audio.Infinite
        onError: console.log(errorString)
        onPlaybackStateChanged: if (playbackState != playbackState.PlayingState) play()
    }
}

