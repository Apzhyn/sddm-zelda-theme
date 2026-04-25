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

    Item {
        anchors.centerIn: parent
        width: 360
        height: 520

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 12

            Item {
                width: 180
                height: 180
                anchors.horizontalCenter: parent.horizontalCenter

                AnimatedImage {
                    anchors.fill: parent
                    source: "whoIsUser.gif"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                width: 360
                height: 320
                radius: 10
                color: "#000000"
                opacity: 0.6
                border.color: "#10b552"
                anchors.horizontalCenter: parent.horizontalCenter

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 18
                    spacing: 12

                    Label {
                        text: "Username"
                        color: "#c1b492"
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter
                    }

                    TextField {
                        id: username
                        Layout.preferredWidth: 280
                        Layout.minimumWidth: 280
                        Layout.maximumWidth: 280
                        height: 36

                        color: "#c1b492"

                        background: Rectangle {
                            color: "#111111"
                            border.color: "#10b552"
                            radius: 4
                        }

                        KeyNavigation.tab: password
                    }

                    Label {
                        text: "Password"
                        color: "#c1b492"
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter
                    }

                    TextField {
                        id: password
                        Layout.preferredWidth: 280
                        Layout.minimumWidth: 280
                        Layout.maximumWidth: 280
                        height: 36
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
                        Layout.preferredWidth: 280
                        Layout.minimumWidth: 280
                        Layout.maximumWidth: 280
                        height: 36
                        model: sessionModel
                        currentIndex: sessionModel.lastIndex
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 42
                        color: "transparent"

                        Label {
                            text: "Login"
                            color: "#cdd61a"
                            font.pixelSize: 28
                            anchors.centerIn: parent

                            MouseArea {
                                anchors.fill: parent
                                onClicked: sddm.login(username.text, password.text, session.index)
                            }
                        }
                    }
                }
            }
        }
    }

    AnimatedImage {
        id: shutdownBtn
        width: 72
        height: 72
        x: parent.width - width - 12
        y: 12
        source: "shutdown.gif"
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: sddm.powerOff()
        }
    }

    AnimatedImage {
        id: rebootBtn
        width: 62
        height: 62
        x: shutdownBtn.x - width - 10
        y: shutdownBtn.y + 6
        source: "logout.gif"
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: sddm.reboot()
        }
    }

    Component.onCompleted: {
        if (username.text === "") {
            username.forceActiveFocus()
        } else {
            password.forceActiveFocus()
        }
    }
}
