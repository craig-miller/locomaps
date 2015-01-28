/*
   Locomaps - Locomaps is touchscreen tablet application for browsing the maps,
   satellite data, and terrain data available from Nokia's Mapping Services.

   © Copyright 2012 Spatial Minds, LLC. All Rights Reserved.

   © Copyright 2012 CyberData Corporation. All Rights Reserved.
  
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
  
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
  
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/*!
  Latching Button Control QML Component

  This is a basic image based button control. The baseImage will be shown
  when the button is in the up state and the clickedImage will be shown when
  the button is in the down state. If latching is true the button will toggle
  between the up and down states when clicked instead of doing a full cycle.

  \property baseImage Accessor alias for the image displayed in the "up" state
  \property clickedImage Accessor alias for the image displayed in the "down" state
  \property latching Boolean value indicating if the button latches down or not
  \property latched Boolean value indicating if the button is latched down or up
  \signal buttonClicked Callback triggered when the button is clicked by the user
*/

// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: container

    signal buttonClicked()

    property alias baseImage: imageBox
    property alias clickedImage: clickedImageBox
    property bool latching: false
    property bool latched: false

    Rectangle {
        id: backgroundRect
        x: parent.x
        y: parent.y
        width: parent.width
        height: parent.height
        anchors.fill: parent
        visible: false
    }

    Image {
        id: imageBox
        anchors.fill: backgroundRect
        visible: true

    }

    Image {
        id: clickedImageBox
        anchors.fill: backgroundRect
        visible: false
    }

    MouseArea {
        id: clickArea

        anchors.fill: backgroundRect

        onPressed: {
            if(!latching) {
                clickedImageBox.visible = true
                imageBox.visible = false
            }
        }

        onReleased: {
            if(!latching) {
                clickedImageBox.visible = false
                imageBox.visible = true
            }
        }

        onClicked: {
            if(latching){
                if(latched){
                    latched = false
                    imageBox.visible = true
                    clickedImageBox.visible = false
                }
                else{
                    latched = true
                    imageBox.visible = false
                    clickedImageBox.visible = true
                }
            }
            container.buttonClicked()
        }
    }

}
