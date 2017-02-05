import QtQuick 2.7
import QtQuick.Window 2.2

import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtPositioning 5.6
import QtLocation 5.6

import mycustomlib 1.0

MyWindow {

    property int setZoom: 10

    id: mainWin

    visible: true
    width: 640
    height: 480
    title: qsTr("Navigation System")

//    MouseArea {
//        anchors.fill: parent
//        onClicked: {
//            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
//        }
//    }

//    TextEdit {
//        id: textEdit
//        text: qsTr("Enter some text...")
//        verticalAlignment: Text.AlignVCenter
//        anchors.top: parent.top
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.topMargin: 20
//        Rectangle {
//            anchors.fill: parent
//            anchors.margins: -10
//            color: "transparent"
//            border.width: 1
//        }
//    }

    Menu {

        id: menuFile
        title: qsTr("&File")
        MenuItem {

            text: qsTr("&Open")
            onTriggered: addressField.open();
        }
        MenuItem {

            text: qsTr("E&xit")
            onTriggered: Qt.quit();
        }
    }

    Dialog {

        id: addressField

        ColumnLayout{

            TextField{

                id: address
                Layout.fillWidth: true
                text: "Enter Address"
            }
        }

        onButtonClicked :{

            geocodeModel.query = address.text
            geocodeModel.update()
        }
        onAccepted: {

            geocodeModel.query = address.text
            geocodeModel.update()
        }
    }

    Map{

        id: map
        zoomLevel: mainWin.setZoom
        anchors.fill: parent
        plugin: Plugin{ name: "osm" }

        GeocodeModel {

            id: geocodeModel
            plugin: map.plugin
            autoUpdate: false
            onLocationsChanged:
                if(count){
                    console.log(qsTr('Info : '+ get(0)))
                    map.center = get(0).coordinate;
                    mapPointer.coordinate = get(0).coordinate;
                }
        }

        MapQuickItem{

            id: mapPointer
            sourceItem: Image {
                id: pointer
                source: "file:blue-dot.png"
            }
            anchorPoint.x: pointer.width /2
            anchorPoint.y: pointer.height
        }

        MouseArea {

            anchors.fill: parent
            onDoubleClicked: {

//                menuFile.popup()
                addressField.open();
            }
        }
        PinchArea {

            property double oldZoom

            function calZoom(curZoom, level) {

                return curZoom + Math.log(level)/Math.log(2)
            }

            anchors.fill: parent
            pinch.target: map

            onPinchStarted: {

                oldZoom = map.zoomLevel
            }
            onPinchUpdated: {

                map.zoomLevel = calZoom(oldZoom, pinch.scale)
            }
            onPinchFinished: {

                map.zoomLevel = calZoom(oldZoom, pinch.scale)
            }
        }
    }
}
