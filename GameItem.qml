import QtQuick 2.4
import "CuteEngine"
import "var.js" as Var

MapItem {
    property int iden: -1
    property int box: 1
    onActivated: {
        Var.itemDialog.close = dialogClose
        Var.itemDialog.itemIden = iden
        Var.itemDialog.visible = true
    }

    function dialogClose() {
        if (Var.itemDialog.ok) {
            if (!Var.isInventoryFull()) {
                Var.inventory.push(iden)
                destory()
            }
            else {
                Var.dialog.text = "Inventory Full!"
                Var.dialog.visible = true
            }
        }
    }

    function destory() {
        blockX = -1
        blockY = -1
        visible = false
    }

    Component.onCompleted: {
        /*
        var tmp = "qrc:/resources/item"
        if (iden < 10)
            tmp += "0" + iden
        else
            tmp += iden
        tmp += ".png"
        source = tmp
        */
        source = "qrc:/resources/item" + (15 + box) + ".png"
    }
}
