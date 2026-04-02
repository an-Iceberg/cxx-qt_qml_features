import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import qml_features 1.0

Page {
    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: qsTr("Increment")

                onClicked: RustSingleton.increment()
            }

            Item {
                Layout.fillWidth: true
            }
        }
    }

    ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Label {
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("Singletons can be used from Rust to store state across the session of the application as normal.")
            wrapMode: Text.Wrap
        }

        Label {
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("In this demo increment this value will persist, even after switching pages.")
            wrapMode: Text.Wrap
        }

        Label {
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            text: RustSingleton.persistentValue
            wrapMode: Text.Wrap
        }
    }
}
