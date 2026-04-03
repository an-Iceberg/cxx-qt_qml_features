import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import qml_features 1.0

Page
{
  id: root

  header: ToolBar
  {
    RowLayout
    {
      anchors.fill: parent

      ToolButton
      {
        text: qsTr("Change Url")

        onClicked: root.website.changeUrl()
      }

      ToolButton
      {
        text: qsTr("Fetch Title")

        onClicked: root.website.fetchTitle()
      }

      Item { Layout.fillWidth: true }
    }
  }

  readonly property ThreadingWebsite website: ThreadingWebsite {}

  ColumnLayout
  {
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter

    Label
    {
      horizontalAlignment: Text.AlignHCenter
      Layout.fillWidth: true
      text: qsTr("Url: %1").arg(root.website.url)
      wrapMode: Text.Wrap
    }

    Label
    {
      horizontalAlignment: Text.AlignHCenter
      Layout.fillWidth: true
      text: qsTr("Title: %1").arg(root.website.title)
      wrapMode: Text.Wrap
    }
  }
}
