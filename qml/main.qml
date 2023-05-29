import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "controls"
import QtQuick.Layouts 1.0

Window {
    id: mainWindow
    width: 1000
    height: 580
    minimumWidth: 800
    minimumHeight: 500
    visible: true
    color: "#00000000"
    title: qsTr("Twizzer")

    // Remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // Propeties
    property int windowStatus: 0
    property int windowMargin: 10

    // Text Edit Properties
    //    property alias actualPage: stackView.currentItem
    QtObject{
        id: internal

        function resetResizeBorders(){
            // Resize visibility
            resizeLeft.visible = true
            resizeRight.visible = true
            resizeBottom.visible = true
//            resizeWindow.visible = true
        }

        function maximizeRestore(){
            if(windowStatus == 0){
                mainWindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                // Resize visibility
                resizeLeft.visible = false
                resizeRight.visible = false
                resizeBottom.visible = false
//                resizeWindow.visible = false
                btnMaximizeRestore.btnIconSource = "../images/svg_images/restore_icon.svg"
            }
            else{
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                // Resize visibility
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function ifMaximizedWindowRestore(){
            if(windowStatus == 1){
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                // Resize visibility
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function restoreMargins(){
            windowStatus = 0
            windowMargin = 10
            // Resize visibility
            internal.resetResizeBorders()
            btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
        }
    }

    Rectangle {
        id: bg
        x: 400
        y: 190
        color: "#55007f"
        border.color: "#2a033d"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: top_bar
                height: 60
                color: "#2a033d"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: title_description
                    y: 36
                    height: 25
                    color: "#6b0d99"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0

                    Label {
                        id: label_top_info
                        color: "#f6f6f6"
                        text: qsTr("Predict Your Sentences With Ease")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 0
                    }

                    Label {
                        id: label_right
                        y: 6
                        color: "#f6f6f6"
                        text: qsTr("Twitter Emotion Analyzer")
                        anchors.left: label_top_info.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                        anchors.rightMargin: 10
                        anchors.bottomMargin: 0
                    }
                }

                Rectangle {
                    id: title_bar
                    height: 35
                    color: "#00ffffff"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    DragHandler {
                        onActiveChanged: if(active){
                                             mainWindow.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }
                    Image {
                        id: app_icon
                        width: 28
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/icon_app_top.svg"
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: title
                        color: "#f6f6f6"
                        text: qsTr("Twizzer")
                        anchors.left: app_icon.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 12
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: top_row
                    x: 848
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0

                    Qt_Quick_App_button{
                        id: btnMinimize
                        onClicked: {
                            mainWindow.showMinimized()
                            internal.restoreMargins()
                        }
                    }

                    Qt_Quick_App_button {
                        id: btnMaximizeRestore
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    Qt_Quick_App_button {
                        id: btnClose
                        btnColorClicked: "#ff007f"
                        btnIconSource: "../images/svg_images/close_icon.png"
                        onClicked: mainWindow.close()
                    }

                }
            }

            Rectangle {
                id: contents
                color: "#00ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: top_bar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: content_page
                    color: "#00ffffff"
                    anchors.fill: parent
                    anchors.bottomMargin: 25



                    GridLayout {
                        id: gridLayout
                        width: 693
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: 345
                        columnSpacing: 20
                        rows: 1
                        columns: 2
                        anchors.topMargin: 48

                        CustomTextField{
                            id: textField
                            width: 500
                            horizontalAlignment: Text.AlignHCenter
                            Layout.maximumHeight: 200
                            Layout.maximumWidth: 500
                            Layout.minimumHeight: 50
                                                placeholderText: "Type your sentence"
                                                Layout.fillWidth: true
                                                Keys.onEnterPressed: {
                                                    backend.welcomeText(textField.text)
                                                }
                                                Keys.onReturnPressed: {
                                                    backend.welcomeText(textField.text)
                                                }

                        }
                        CustomButton{
                            id: btnChangeName
                            width: 50
                            height: 50
                            text: "Predict "
                            Layout.maximumWidth: 160
                            Layout.fillWidth: true
                            Layout.preferredHeight: 45
                            Layout.preferredWidth: 250
                                                onClicked: {
                                                    backend.welcomeText(textField.text)
                                                }
                        }
                    }

                    Label {
                        id: labelTextName
                        width: 378
                        color: "#ffffff"
                        text: qsTr("No Text Has Been Entered Yet")
                        anchors.top: gridLayout.bottom
                        anchors.bottom: gridLayout.top
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: -202
                        anchors.topMargin: 25
                        font.bold: true
                        font.family: "Courier"
                        font.pointSize: 20
                    }

                    Image {
                        id: emote
                        width: 216
                        anchors.top: labelTextName.bottom
                        anchors.bottom: labelTextName.top
                        source: "../images/svg_images/think.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 44
                        anchors.bottomMargin: -272
                        fillMode: Image.PreserveAspectFit
                    }

                }

                Rectangle {
                    id: bottom_bar
                    color: "#6b0d99"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: content_page.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: label_top_info1
                        x: 8
                        y: -473
                        color: "#f6f6f6"
                        text: qsTr("Made by Shaikh Saad Ali and Saziya Akrar")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 8
                        anchors.topMargin: 0
                        anchors.rightMargin: 30
                        anchors.bottomMargin: 0
                    }
                }
            }
        }
    }

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: "SizeHorCursor"

        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.LeftEdge) }

        }

    }

    MouseArea {
            id: resizeRight
            width: 10
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            cursorShape: Qt.SizeHorCursor

            DragHandler{
                target: null
                onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.RightEdge) }
            }
        }

        MouseArea {
            id: resizeBottom
            height: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 0
            cursorShape: Qt.SizeVerCursor

            DragHandler{
                target: null
                onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.BottomEdge) }
            }
        }
        Connections{
                target: backend

                function onSetName(text){
                    labelTextName.text = text
                }
                function onSetEmote(text){
                    emote.source=text
                }
        }

}
