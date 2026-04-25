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

    Rectangle {
        width: 320
        height: 320
        anchors.centerIn: parent
        radius: 10
        color: "#000000"
        opacity: 0.6
        border.color: "#10b552"

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 10

            Label {
                text: "Username:"
                color: "#c1b492"
                font.pixelSize: 16
                Layout.alignment: Qt.AlignHCenter
            }

            TextField {
                id: username
                width: 240
                color: "#c1b492"

                background: Rectangle {
                    color: "#111111"
                    border.color: "#10b552"
                    radius: 4
                }

                KeyNavigation.tab: password

                Keys.onPressed: function(event) {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        sddm.login(username.text, password.text, session.index)
                        event.accepted = true
                    }
                }
            }

            Label {
                text: "Password:"
                color: "#c1b492"
                font.pixelSize: 16
                Layout.alignment: Qt.AlignHCenter
            }

            TextField {
                id: password
                width: 240
                echoMode: TextInput.Password
                color: "#c1b492"

                background: Rectangle {
                    color: "#111111"
                    border.color: "#10b552"
                    radius: 4
                }

                KeyNavigation.tab: session

                Keys.onPressed: function(event) {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        sddm.login(username.text, password.text, session.index)
                        event.accepted = true
                    }
                }
            }

            ComboBox {
                id: session
                width: 240
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

    AnimatedImage {
        id: shutdownBtn
        width: 70
        height: 70
        x: parent.width - width - 10
        y: 10
        source: "shutdown.gif"
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: sddm.powerOff()
        }
    }

    AnimatedImage {
        id: rebootBtn
        width: 60
        height: 60
        x: shutdownBtn.x - width - 10
        y: shutdownBtn.y + 5
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
