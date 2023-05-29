import QtQuick 2.15
import QtQuick.Controls 2.15
//import QtGraphicalEffects 1.15

TextField {
    id: textField

    // Custom Properties
    property color colorDefault: "#282c34"
    property color colorOnFocus: "#242831"
    property color colorMouseOver: "#2B2F38"

    QtObject{
        id: internal

        property var dynamicColor: if(textField.focus){
                                        textField.hovered ? colorOnFocus : colorDefault
                                   }else{
                                       textField.hovered ? colorMouseOver : colorDefault
                                   }
    }

    width: 200
    height: 30
    placeholderText: qsTr("Type something")
    color: "#ffffff"
    horizontalAlignment: Text.AlignHCenter
    font.pointSize: 12
    background: Rectangle {
        color: internal.dynamicColor
        radius: 15
    }

    selectByMouse: true
    selectedTextColor: "#FFFFFF"
    selectionColor: "#ff007f"
    placeholderTextColor: "#81848c"
}

