import QtQuick 2.15
import QtQuick.Controls 2.15

Button{
    id: btnTopBar
    property url btnIconSource: "../../images/svg_images/minimize_icon.svg"
    property color colorDefault: "#2a033d"
    property color  colorMouseOver: "#6505a9"
//    property color  colorPressed: "#43cbd1"
    property color btnColorClicked: "#00a1f1"

    QtObject{
        id: internal

        property var dynamicColor: if(btnTopBar.down){
                                       btnTopBar.down ? btnColorClicked: colorDefault

                                   }else{
                                       btnTopBar.hovered ? colorMouseOver: colorDefault
                                   }
    }
    height: 35
    width: 35

    background: Rectangle{
        id: bgBtnk
        color: internal.dynamicColor

        Image {
            id: iconBtn
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            anchors.verticalCenter: parent.verticalCenter
            source: btnIconSource
            width: 16
            fillMode:  Image.PreserveAspectFit
            antialiasing: false


        }

//        ColorOverlay{
//                    anchors.fill: iconBtn
//                    source: iconBtn
//                    color: "#ffffff"
//                    antialiasing: false
//                }
    }

}
