import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

import qml_features 1.0

ApplicationWindow {
    id: window
    minimumHeight: 480
    minimumWidth: 640
    title: qsTr("CXX-Qt: QML Features")
    visible: true

    header: RowLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        Button {
            flat: true
            font.pixelSize: 24
            text: drawer.position == 1.0 ? "✕" : "☰"
            Layout.preferredWidth: height

            onClicked: {
                if (drawer.position == 1.0) {
                    drawer.close();
                } else {
                    drawer.open();
                }
            }
        }

        Label {
            text: drawer.currentItem.text
            font.pixelSize: 24
            Layout.fillWidth: true
        }
    }

    Drawer {
        id: drawer

        readonly property alias currentItem: drawerView.currentItem

        clip: true
        height: window.height - header.height
        width: Math.min(window.width * 0.66, 200)
        y: header.height

        ListView {
            id: drawerView
            anchors.fill: parent
            currentIndex: 0
            delegate: ItemDelegate {
                highlighted: ListView.isCurrentItem
                text: model.name
                width: ListView.view.width

                readonly property string source: model.source

                onClicked: {
                    ListView.view.currentIndex = index;
                    drawer.close();
                }
            }
            model: ListModel {
                ListElement {
                    name: "Properties"
                    source: "pages/Properties.qml"
                }
                ListElement {
                    name: "Invokables"
                    source: "pages/Invokables.qml"
                }
                ListElement {
                    name: "Signals"
                    source: "pages/Signals.qml"
                }
                ListElement {
                    name: "Threading"
                    source: "pages/Threading.qml"
                }
                ListElement {
                    name: "Custom Base Class"
                    source: "pages/CustomBaseClass.qml"
                }
                ListElement {
                    name: "Serialization"
                    source: "pages/Serialization.qml"
                }
                ListElement {
                    name: "Types"
                    source: "pages/Types.qml"
                }
                ListElement {
                    name: "Containers"
                    source: "pages/Containers.qml"
                }
                ListElement {
                    name: "Multiple QObjects"
                    source: "pages/MultipleQObjects.qml"
                }
                ListElement {
                    name: "Naming"
                    source: "pages/Naming.qml"
                }
                ListElement {
                    name: "Nested QObjects"
                    source: "pages/NestedQObjects.qml"
                }
                ListElement {
                    name: "Singleton"
                    source: "pages/Singleton.qml"
                }
                ListElement {
                    name: "Custom Parent Class"
                    source: "pages/CustomParentClass.qml"
                }
                ListElement {
                    name: "ExternCxxQt"
                    source: "pages/ExternCxxQt.qml"
                }
            }
        }
    }

    Loader {
        anchors.fill: parent
        asynchronous: true
        source: drawer.currentItem.source
    }
}
