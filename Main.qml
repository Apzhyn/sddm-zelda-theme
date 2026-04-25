import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Item {
    width: 1920
    height: 1080

    Image {
        anchors.fill: parent
        source: "landscape.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10
        anchors.verticalCenterOffset: -40

        AnimatedImage {
            source: "whoIsUser.gif"
            width: 140
            height: 140
            fillMode: Image.PreserveAspectFit
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            width: 340
            height: 320
            radius: 10
            color: "#000000"
            opacity: 0.6
            border.color: "#10b552"
            Layout.alignment: Qt.AlignHCenter

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 8

                Label {
                    text: "Username:"
                    color: "#c1b492"
                    font.pixelSize: 16
                    Layout.alignment: Qt.AlignHCenter
                }

                TextField {
                    id: username
                    Layout.preferredWidth: 260
                    Layout.maximumWidth: 260
                    height: 35

                    color: "#c1b492"
                    background: Rectangle {
                        color: "#111111"
                        border.color: "#10b552"
                        radius: 4
                    }

                    KeyNavigation.tab: password
                }

                Label {
                    text: "Password:"
                    color: "#c1b492"
                    font.pixelSize: 16
                    Layout.alignment: Qt.AlignHCenter
                }

                TextField {
                    id: password
                    Layout.preferredWidth: 260
                    Layout.maximumWidth: 260
                    height: 35
                    echoMode: TextInput.Password

                    color: "#c1b492"
                    background: Rectangle {
                        color: "#111111"
                        border.color: "#10b552"
                        radius: 4
                    }

                    KeyNavigation.tab: session
                }

                ComboBox {
                    id: session
                    Layout.preferredWidth: 260
                    Layout.maximumWidth: 260
                    height: 35
                    model: sessionModel
                    currentIndex: sessionModel.lastIndex
                }

                Label {
                    text: "Login"
                    color: "#cdd61a"
                    font.pixelSize: 28
                    Layout.alignment: Qt.AlignHCenter

                    MouseArea {
                        anchors.fill: parent
                        onClicked: sddm.login(username.text, password.text, session.index)
                    }
                }
            }
        }
    }
}
