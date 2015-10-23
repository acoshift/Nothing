import QtQuick 2.5

CuteObject {
    id: self
    readonly property string __className: "Scene"

    property list<Source> __data
    default property alias data: self.__data
    property list<Transitor> transitors
    property alias __source: _loader.source

    Loader {
        id: _loader
        anchors.fill: parent
        source: (__data[0]) ? __data[0].source : ""
        focus: true
    }

    anchors.fill: parent

    on__Handle: {
        var ts = self.transitors
        for (var i = 0; i < ts.length; ++i) {
            if (ts[i].name == state && ts[i].message == msg) {
                ts[i].__activate(this) // state changed
                var p = __data
                for (var j = 0; j < p.length; ++j) {
                    if (p[j].name == state) {
                        _loader.source = p[j].source
                    }
                }
                return
            }
        }
        // parent.__handle(msg)
    }

    Component.onCompleted: {
        if (!__data[0])
            return
        if (state == "") {
            state = __data[0].name
        }
        else
        {
            var p = __data
            for (var i = 0; i < p.length; ++i) {
                if (p[i].name === state) {
                    _loader.source = p[i].source
                }
            }
        }
    }
}

