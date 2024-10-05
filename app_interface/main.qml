import QtQml.Models
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Dialogs
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    id: mainWindow
    width: 700
    height: 700
    visible: true

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainInterface

        pushEnter: Transition {
            NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 50 }
            NumberAnimation { property: "scale"; from: 0.8; to: 1; duration: 50 }
        }
        pushExit: Transition {
            NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 50 }
            NumberAnimation { property: "scale"; from: 1; to: 0.8; duration: 50 }
        }
    }

    Component {
        id: mainInterface
        Item {
            Image {
                id: backgroundMilkyWayImage
                source: "../resources/pictures/MilkyWay.png"
                anchors.fill: parent
                anchors.centerIn: parent
                scale: Qt.KeepAspectRatio
                transformOrigin: Item.Center
            }

            Text {
                id: title
                text: "Exosky App"
                color: "White"
                font.bold: true
                font.pixelSize: 20
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }
            
            Button {
                id: button
                text: "Let's explore!"
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    stackView.push(constellationInterface)
                }
            }
        }
    }

    Component {
        id: constellationInterface
        Item {
            Image {
                id: backgroundStarImage
                source: "../resources/pictures/universe_evolutionary.png"
                anchors.fill: parent
                anchors.centerIn: parent
                scale: Qt.KeepAspectRatio
                transformOrigin: Item.Center
            }

            ColumnLayout {
                anchors.centerIn: parent

                Rectangle {
                    id: constellationIntroduction
                    color: "#64000000"
                    width: 700
                    height: 80
                    Layout.alignment: Qt.AlignHCenter


                    Text {
                        id: constellationText
                        text: "Thousands of years ago, our ancestors looked up the nightsky and studied stars. " +
                              "Their locations are observed and drawn, creating a map of stars and forming constellations. " +
                              "How are constellations depicted in our galaxy, the Milky Way?"
                        color: "white"
                        font.pixelSize: 16
                        anchors.centerIn: parent
                        width: parent.width
                        height: parent.height
                        wrapMode: Text.WordWrap
                    }
                }

                Button {
                    id: overlayConstellationButton
                    text: "See constellation."
                    Layout.alignment: Qt.AlignHCenter
                    onClicked: {
                        constellationImage.visible = !constellationImage.visible
                    }
                }

                Item {
                    Layout.alignment: Qt.AlignHCenter
                    width: 700
                    height: 350

                    Image {
                        id: starMapImage
                        source: "../resources/pictures/star_map.png"
                        fillMode: Image.PreserveAspectFit
                        anchors.fill: parent
                    }

                    Image {
                        id: constellationImage
                        source: "../resources/pictures/constellation_star_map.png"
                        fillMode: Image.PreserveAspectFit
                        anchors.fill: parent
                        visible: false
                    }
                }
            }
            

            Button {
                id: backMainButton
                text: "Back"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                onClicked: {
                    stackView.push(mainInterface)
                }
            }

            Button {
                id: continueExoButton
                text: "Continue"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                onClicked: {
                    stackView.push(introduceExoplanetInterface)
                }
            }
        }
    }

    Component {
        id: introduceExoplanetInterface
        Item {
            Image {
                id: k218bImage
                source: "../resources/pictures/k2-18b_.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
            }

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 20

                Rectangle {
                    id: constellationIntroduction
                    color: "#50000000"
                    width: 700
                    height: 150
                    Layout.alignment: Qt.AlignHCenter


                    Text {
                        id: constellationText
                        text: "Those constellations are from Earth's point of view. " +
                              "\nFrom observations, scientists can pinpoint the exact location of an astronomical object, using concepts such as Right Ascension (RA), Declination (Dec), and Parallax as coordinates. " +
                              "\nImagine that we space-travel to an exoplanet. How would the location of stars change with respected to Earth? " +
                              "\nLet's explore the exoplanets originated from TOI-700, Trappist-1 and Ross 128 b."
                        color: "white"
                        font.pixelSize: 16
                        anchors.centerIn: parent
                        width: parent.width
                        height: parent.height
                        wrapMode: Text.WordWrap
                    }
                }

                Row {
                    spacing: 50
                    Button {
                        id: toi700Button
                        text: "View infos about TOI-700 d."
                        onClicked: {
                            stackView.push(toi700dInterface)
                        }
                    }

                    Button {
                        id: ross128bButton
                        text: "View infos about Ross 128 b."
                        onClicked: {
                            stackView.push(ross128bInterface)
                        }
                    }

                    Button {
                        id: trappist1eButton
                        text: "View infos about Trappist-1 e."
                        onClicked: {
                            stackView.push(trappist1eInterface)
                        }
                    }

                }
            }

            Button {
                id: backConstellationButton
                text: "Back"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                onClicked: {
                    stackView.push(constellationInterface)
                }
            }

            Button {
                id: continueExoConsteButton
                text: "Continue"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                onClicked: {
                    stackView.push(introduceExoplanetInterface)
                }
            }
        }
    }
    
    Component {
        id: toi700dInterface

        Item {
            Image {
                id: toi700dImage
                source: "../resources/pictures/toi-700d_location_edit_1.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
            }

            Rectangle {
                id: toi700dOverview
                color: "#64000000"
                width: 250
                height: 180
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                Text {
                    id: toi700dText
                    text: "Location: 101.4 light-years away from Earth. " +
                          "\nConstellation: Dorado." +
                          "\nStar system: red dwarf TOI-700. " +
                          "\nRight ascension: 06h28m22.97s. " +
                          "\nDeclination: -65d34m43.01s. " +
                          "\nOrbital period: 37 Earth days at 0.163 AU to its host star. "
                    color: "white"
                    font.pixelSize: 16
                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height
                    wrapMode: Text.WordWrap
                }
            }

            Button {
                id: continueExoConsteButton
                text: "Back"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                onClicked: {
                    stackView.push(introduceExoplanetInterface)
                }
            }
        }
    }

    Component {
        id: ross128bInterface

        Item {
            Image {
                id: ross128bImage
                source: "../resources/pictures/ross-128b_location_edit_1.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
            }

            Rectangle {
                id: ross128bOverview
                color: "#64000000"
                width: 250
                height: 180
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                Text {
                    id: ross128bText
                    text: "Location: 11 light-years away from Earth. " +
                          "\nConstellation: Virgo." +
                          "\nStar system: red dwarf ROSS 128. " +
                          "\nRight ascension: 11h47m45.02s. " +
                          "\nDeclination: +00d47m57.44s. " +
                          "\nOrbital period: 9.9 Earth days at 0.0496 AU to its host star. "
                    color: "white"
                    font.pixelSize: 16
                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height
                    wrapMode: Text.WordWrap
                }
            }

            Button {
                id: continueExoConsteButton
                text: "Back"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                onClicked: {
                    stackView.push(introduceExoplanetInterface)
                }
            }
        }
    }

    Component {
        id: trappist1eInterface

        Item {
            Image {
                id: trappist1eImage
                source: "../resources/pictures/trappist-1e_location_edit_1.png"
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
            }

            Rectangle {
                id: trappist1eOverview
                color: "#64000000"
                width: 290
                height: 210
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                Text {
                    id: trappist1eText
                    text: "Location: 39 light-years away from Earth. " +
                          "\nConstellation: Aquarius." +
                          "\nStar system: ultracool dwarf star TRAPPIST-1 contains 7 potential Earth-sized exoplanets. " +
                          "\nRight ascension: 06h28m22.97s. " +
                          "\nDeclination: -65d34m43.01s. " +
                          "\nOrbital period: 6.1 Earth days at 0.029 AU to its host star. "
                    color: "white"
                    font.pixelSize: 16
                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height
                    wrapMode: Text.WordWrap
                }
            }

            Button {
                id: continueExoConsteButton
                text: "Back"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                onClicked: {
                    stackView.push(introduceExoplanetInterface)
                }
            }
        }
    }
}
