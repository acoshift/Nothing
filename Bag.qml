import QtQuick 2.5
import "CuteEngine"
import "var.js" as Var

Page {
    Item {
        anchors.centerIn: parent
        width: _bg.implicitWidth
        height: _bg.implicitHeight
        Image {
            id: _bg
            source: "qrc:/resources/bag.png"
            anchors.fill: parent
        }
        Item {
            width: 90; height: 90
            x: 75; y: 110
            Image { id: _img0; anchors.fill: parent; opacity: 0.7 }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (dialog.visible) return
                    if (_img0.opacity == 1.0) useItem(0)
                    else {
                        resetOpacity()
                        _img0.opacity = 1.0
                        if (Var.inventory[0]) _text.text = Var.itemText[Var.inventory[0] - 1]
                    }
                }
            }
        }
        Item {
            width: 90; height: 90
            x: 185; y: 110
            Image { id: _img1; anchors.fill: parent; opacity: 0.7 }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (dialog.visible) return
                    if (_img1.opacity == 1.0) useItem(1)
                    else {
                        resetOpacity()
                        _img1.opacity = 1.0
                        if (Var.inventory[1]) _text.text = Var.itemText[Var.inventory[1] - 1]
                    }
                }
            }
        }
        Item {
            width: 90; height: 90
            x: 295; y: 110
            Image { id: _img2; anchors.fill: parent; opacity: 0.7 }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (dialog.visible) return
                    if (_img2.opacity == 1.0) useItem(2)
                    else {
                        resetOpacity()
                        _img2.opacity = 1.0
                        if (Var.inventory[2]) _text.text = Var.itemText[Var.inventory[2] - 1]
                    }
                }
            }
        }
        Item {
            width: 90; height: 90
            x: 75; y: 210
            Image { id: _img3; anchors.fill: parent; opacity: 0.7 }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (dialog.visible) return
                    if (_img3.opacity == 1.0) useItem(3)
                    else {
                        resetOpacity()
                        _img3.opacity = 1.0
                        if (Var.inventory[3]) _text.text = Var.itemText[Var.inventory[3] - 1]
                    }
                }
            }
        }
        Item {
            width: 90; height: 90
            x: 185; y: 210
            Image { id: _img4; anchors.fill: parent; opacity: 0.7 }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (dialog.visible) return
                    if (_img4.opacity == 1.0) useItem(4)
                    else {
                        resetOpacity()
                        _img4.opacity = 1.0
                        if (Var.inventory[4]) _text.text = Var.itemText[Var.inventory[4] - 1]
                    }
                }
            }
        }
        Item {
            width: 90; height: 90
            x: 295; y: 210
            Image { id: _img5; anchors.fill: parent; opacity: 0.7 }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (dialog.visible) return
                    if (_img5.opacity == 1.0) useKey()
                    else {
                        resetOpacity()
                        _img5.opacity = 1.0
                        if (Var.currentKey) _text.text = Var.keyText[Var.currentKey - 1]
                    }
                }
            }
        }

        // Rectangle { width: 90; height: 90; x: 75; y: 110; color: "red" }
        // Rectangle { width: 90; height: 90; x: 185; y: 110; color: "red" }
        // Rectangle { width: 90; height: 90; x: 295; y: 110; color: "red" }
        // Rectangle { width: 90; height: 90; x: 75; y: 210; color: "red" }
        // Rectangle { width: 90; height: 90; x: 185; y: 210; color: "red" }
        // Rectangle { width: 90; height: 90; x: 295; y: 210; color: "red" }

        // Rectangle { width: 120; height: 70; x: 420; y: 110; color: "red" }
        // Rectangle { width: 120; height: 70; x: 420; y: 190; color: "red" }
        // Rectangle { width: 120; height: 70; x: 420; y: 270; color: "red" }
        MouseArea {
            width: 120; height: 70
            x: 420; y: 110
            onClicked: {
                Var.save()
                dialogText.text = "Save completed."
                dialog.visible = true
            }
        }
        MouseArea {
            width: 120; height: 70
            x: 420; y: 190
            onClicked: {
                Var.load()
                dialogText.text = "Load completed."
                dialog.visible = true
            }
        }
        MouseArea {
            width: 120; height: 70
            x: 420; y: 270
            onClicked: {
                if (dialog.visible) return
                Qt.quit()
            }
        }

        Item {
            width: 300; height: 40; x: 85; y: 320;
            Text { id: _text; anchors.centerIn: parent; font.pixelSize: 28 }
        }
    }
    onVisibleChanged: {
        if (visible) {
            reset()
        }
    }
    function reset() {
        dialog.visible = false
        _img0.source = Var.inventory[0] ? Var.itemSource(Var.inventory[0]) : ""
        _img1.source = Var.inventory[1] ? Var.itemSource(Var.inventory[1]) : ""
        _img2.source = Var.inventory[2] ? Var.itemSource(Var.inventory[2]) : ""
        _img3.source = Var.inventory[3] ? Var.itemSource(Var.inventory[3]) : ""
        _img4.source = Var.inventory[4] ? Var.itemSource(Var.inventory[4]) : ""
        _img4.source = Var.currentKey ? Var.keySource(Var.currentKey) : ""
        _text.text = ""
        resetOpacity()
    }

    function useItem(it) {
        Var.useItem(it)
        reset()
    }

    function useKey() {
        //
    }

    function resetOpacity() {
        _img0.opacity = 0.7
        _img1.opacity = 0.7
        _img2.opacity = 0.7
        _img3.opacity = 0.7
        _img4.opacity = 0.7
        _img5.opacity = 0.7
    }

    // dialog
    Item {
        id: dialog
        width: 571
        height: 203
        anchors.centerIn: parent
        visible: false
        Image {
            source: "qrc:/resources/text.png"
            anchors.fill: parent
        }
        Text {
            id: dialogText
            anchors.centerIn: parent
            font.pixelSize: 40
        }
        MouseArea {
            anchors.fill: parent
            onClicked: parent.visible = false
        }
    }
}

