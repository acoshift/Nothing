import QtQuick 2.5
import "CuteEngine"
import "var.js" as Var

Page {
    Timer {
        running: true
        repeat: true
        interval: 5000
        onTriggered: {
            Var.fullness -= 1
            console.log("Fullness: " + Var.fullness)
            if (Var.fullness <= 0) Var.gameOver()
        }
    }
    Timer {
        running: true
        repeat: true
        interval: 8000
        onTriggered: {
            Var.infection -= 1
            console.log("Infection: " + Var.infection)
            if (Var.infection <= 0) Var.gameOver()
        }
    }

    Sequence {
        name: "map"

        Source { name: "map01"; source: "qrc:/map01.qml" }
        Source { name: "map02"; source: "qrc:/map02.qml" }
        Source { name: "map03"; source: "qrc:/map03.qml" }
        Source { name: "map04"; source: "qrc:/map04.qml" }
        Source { name: "map05"; source: "qrc:/map05.qml" }
        Source { name: "map06"; source: "qrc:/map06.qml" }
        Source { name: "map07"; source: "qrc:/map07.qml" }
        Source { name: "map08"; source: "qrc:/map08.qml" }
        Source { name: "map09"; source: "qrc:/map09.qml" }

        transitors: [
            Transitor { name: "map01"; next: "map02"; message: "map02" },
            Transitor { name: "map02"; next: "map01"; message: "map01" },
            Transitor { name: "map02"; next: "map09"; message: "map09" },
            Transitor { name: "map03"; next: "map09"; message: "map09" },
            Transitor { name: "map04"; next: "map09"; message: "map09" },
            Transitor { name: "map05"; next: "map09"; message: "map09" },
            Transitor { name: "map06"; next: "map07"; message: "map07" },
            Transitor { name: "map06"; next: "map09"; message: "map09" },
            Transitor { name: "map07"; next: "map06"; message: "map06" },
            Transitor { name: "map08"; next: "map09"; message: "map09" },
            Transitor { name: "map09"; next: "map02"; message: "map02" },
            Transitor { name: "map09"; next: "map03"; message: "map03" },
            Transitor { name: "map09"; next: "map04"; message: "map04" },
            Transitor { name: "map09"; next: "map05"; message: "map05" },
            Transitor { name: "map09"; next: "map06"; message: "map06" },
            Transitor { name: "map09"; next: "map08"; message: "map08" }
        ]

        state: Var.mapState

        function screenReset() {
            __source = ""
            for (var i = 0; i < data.length; ++i) {
                if (data[i].name == Var.mapState) {
                    state = Var.mapState
                    __source = data[i].source
                }
            }
        }

        onStateChanged: Var.mapState = state
        Component.onCompleted: Var.screenReset = screenReset
    }
    // Keys.forwardTo: _item
    // UI
    Item {
        id: _item
        property int buttonSize: 100
        anchors.fill: parent
        /*
        Keys.onPressed: {
            if (event.key == Qt.Key_W && !Var.btnUp) { Var.btnUp = true; holdTimer.start() }
            if (event.key == Qt.Key_S && !Var.btnDown) { Var.btnDown = true; holdTimer.start() }
            if (event.key == Qt.Key_A && !Var.btnLeft) { Var.btnLeft = true; holdTimer.start() }
            if (event.key == Qt.Key_D && !Var.btnRight) { Var.btnRight = true; holdTimer.start() }
            if (event.key == Qt.Key_Z) Var.currentMap.activeMapItem(Var.currentChar._itemX, Var.currentChar._itemY)
        }
        Keys.onReleased: {
            if (event.key == Qt.Key_W && Var.btnUp) { Var.btnUp = false; holdTimer.stop() }
            if (event.key == Qt.Key_S && Var.btnDown) { Var.btnDown = false; holdTimer.stop() }
            if (event.key == Qt.Key_A && Var.btnLeft) { Var.btnLeft = false; holdTimer.stop() }
            if (event.key == Qt.Key_D && Var.btnRight) { Var.btnRight = false; holdTimer.stop() }
        }
*/
        // opacity: 0.5
        Status { }
        Bag {
            id: bag
            visible: false
            Component.onCompleted: Var.bag = this
        }
        ItemDialog {
            id: itemDialog
            visible: false
            Component.onCompleted: Var.itemDialog = this
        }
        Dialog {
            id: dialog
            visible: false
            Component.onCompleted: Var.dialog = this
        }
        Item {
            width: _item.buttonSize * 3
            height: _item.buttonSize * 3
            anchors {
                left: parent.left
                bottom: parent.bottom
                margins: 50
            }

            Button {
                width: _item.buttonSize
                height: _item.buttonSize
                source: "qrc:/resources/btn06.png"
                anchors {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                }
                onPressed: { if (Var.currentChar.isRunning()) return; Var.btnUp = true; holdTimer.start() }
                onRelease: { Var.btnUp = false; holdTimer.stop() }
            }
            Button {
                width: _item.buttonSize
                height: _item.buttonSize
                source: "qrc:/resources/btn07.png"
                anchors {
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                }
                onPressed: { if (Var.currentChar.isRunning()) return; Var.btnDown = true; holdTimer.start() }
                onRelease: { Var.btnDown = false; holdTimer.stop() }
            }
            Button {
                width: _item.buttonSize
                height: _item.buttonSize
                source: "qrc:/resources/btn08.png"
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
                onPressed: { if (Var.currentChar.isRunning()) return; Var.btnLeft = true; holdTimer.start() }
                onRelease: { Var.btnLeft = false; holdTimer.stop() }
            }
            Button {
                width: _item.buttonSize
                height: _item.buttonSize
                source: "qrc:/resources/btn09.png"
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
                onPressed: { if (Var.currentChar.isRunning()) return; Var.btnRight = true; holdTimer.start() }
                onRelease: { Var.btnRight = false; holdTimer.stop() }
            }
        }
        Item {
            width: _item.buttonSize * 2
            anchors {
                top: parent.top
                right: parent.right
                bottom: parent.bottom
                margins: 50
            }
            Button { // A button
                id: btnA
                width: _item.buttonSize
                height: _item.buttonSize
                source: "qrc:/resources/btn10.png"
                anchors {
                    right: parent.right
                    bottom: btnB.top
                }
                onPressed: {
                    if (dialog.visible) {
                        dialog.ok = true
                        dialog.visible = false
                    }
                    else if (itemDialog.visible) {
                        itemDialog.ok = true
                        itemDialog.visible = false
                    }
                    else
                        Var.currentMap.activeMapItem(Var.currentChar._itemX, Var.currentChar._itemY)
                }
            }
            Button { // B button
                id: btnB
                width: _item.buttonSize
                height: _item.buttonSize
                source: "qrc:/resources/btn11.png"
                anchors {
                    bottom: parent.bottom
                    right: btnA.left
                }
                onPressed: {
                    if (dialog.visible) { dialog.ok = false; dialog.visible = false}
                    else if (itemDialog.visible) { itemDialog.ok = false; itemDialog.visible = false }
                    else if (bag.visible) bag.visible = false
                }
            }
            Button { // Bag button
                width: _item.buttonSize
                height: _item.buttonSize
                source: "qrc:/resources/btn12.png"
                anchors {
                    top: parent.top
                    right: parent.right
                }
                onPressed: bag.visible = !bag.visible
            }
        }

        Timer {
            id: holdTimer
            interval: 100//220
            running: false
            repeat: true
            triggeredOnStart: true
            onTriggered: {
                if (dialog.visible || bag.visible) return
                if (Var.currentChar.isRunning()) return
                if (Var.btnUp) Var.currentChar.moveUp();
                if (Var.btnDown) Var.currentChar.moveDown();
                if (Var.btnLeft) Var.currentChar.moveLeft();
                if (Var.btnRight) Var.currentChar.moveRight();
            }
        }
    }
}
