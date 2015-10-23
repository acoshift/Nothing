import QtQuick 2.4
import "CuteEngine"
import "var.js" as Var

MapItem {
    property var text: []
    property int index: 0
    onActivated: next()
    property bool pic: false
    function next() {
        if (index >= text.length || (index > 0 && !Var.dialog.ok)) {
            index = 0
            return
        }
        Var.dialog.text.text = text[index]
        Var.dialog.close = next
        Var.dialog.pic = pic
        Var.dialog.visible = true
        ++index
    }
}
