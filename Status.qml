import QtQuick 2.4
import "CuteEngine"
import "var.js" as Var

Item {
    width: _img.implicitWidth
    height: _img.implicitHeight
    Image {
        id: _img
        source: "qrc:/resources/status.png"
    }
    Image { id: f1; x: 169; y: 17; source: "qrc:/resources/hf.png" }
    Image { id: f2; x: 210; y: 17; source: "qrc:/resources/hf.png" }
    Image { id: f3; x: 251; y: 17; source: "qrc:/resources/hf.png" }
    Image { id: f4; x: 292; y: 17; source: "qrc:/resources/hf.png" }
    Image { id: f5; x: 333; y: 17; source: "qrc:/resources/hf.png" }

    Image { id: i1; x: 169; y: 55; source: "qrc:/resources/hi.png" }
    Image { id: i2; x: 210; y: 55; source: "qrc:/resources/hi.png" }
    Image { id: i3; x: 251; y: 55; source: "qrc:/resources/hi.png" }
    Image { id: i4; x: 292; y: 55; source: "qrc:/resources/hi.png" }
    Image { id: i5; x: 333; y: 55; source: "qrc:/resources/hi.png" }

    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            f1.opacity = Var.fullness / 20
            f2.opacity = (Var.fullness - 20) / 20
            f3.opacity = (Var.fullness - 40) / 20
            f4.opacity = (Var.fullness - 60) / 20
            f5.opacity = (Var.fullness - 80) / 20

            i1.opacity = Var.infection / 20
            i2.opacity = (Var.infection - 20) / 20
            i3.opacity = (Var.infection - 40) / 20
            i4.opacity = (Var.infection - 60) / 20
            i5.opacity = (Var.infection - 80) / 20
        }
    }
}

