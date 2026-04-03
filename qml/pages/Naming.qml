import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import qml_features 1.0

Page
{
  id: root

  readonly property RenamedObject renamedObject: RenamedObject
  {
    numberProp: 1
  }

  Column
  {
    anchors.fill: parent
    anchors.margins: 10
    spacing: 15

    Label
    {
      Layout.fillWidth: true
      horizontalAlignment: Text.AlignHCenter
      text: qsTr("Counter: %1").arg(root.renamedObject.numberProp)
      wrapMode: Text.Wrap
    }

    Button
    {
      text: qsTr("Increment Counter")
      onClicked: root.renamedObject.increment()
    }

    Label
    {
      Layout.fillWidth: true
      horizontalAlignment: Text.AlignHCenter
      text: qsTr("Meaning of life: %1").arg(root.renamedObject.getNum())
      wrapMode: Text.Wrap
    }
  }
}
