import QtQuick 2.5

QtObject {
    id: self
    property string name: ""
    property string next: ""
    property string message: ""
    signal activated()

    function __activate(host) {
        host.state = next
        var __data = host.__data
        for (var i = 0; i < __data.length; ++i) {
            if (__data[i].name === next) {
                host.__source = __data[i].source
                break
            }
        }
        activated()
    }
}

