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

// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
/*!
  Tristate Button Control QML Component

  This is a three state button, which will display three seperate sets of images
  based on the current state. Images may also be provided for the up and down state
  of the button to show the clicking action.

  \property state1Image Accessor alias for the image displayed in the "up" condition for state 1
  \property state1PressedImage Accessor alias for the image displayed in the "down" condition for state 1
  \property state2Image Accessor alias for the image displayed in the "up" condition for state 2
  \property state2PressedImage Accessor alias for the image displayed in the "down" condition for state 2
  \property state3Image Accessor alias for the image displayed in the "up" condition for state 3
  \property state3PressedImage Accessor alias for the image displayed in the "down" condition for state 3
  \property state The current state of the button [1-3]
*/

import QtQuick 1.1

Item {
    id: triButtonContainer

    property string state1Image: ""
    property string state1PressedImage: ""
    property string state2Image: ""
    property string state2PressedImage: ""
    property string state3Image: ""
    property string state3PressedImage: ""

    property real state: 2

    signal stateUpdated()

    Button {
        id: baseButton

        anchors.fill: parent
        baseImage.source: state2Image
        clickedImage.source: state2PressedImage

        onButtonClicked: {
            switch(triButtonContainer.state)
            {
            case 1:
                baseButton.baseImage.source = state2Image
                baseButton.clickedImage.source = state2PressedImage
                triButtonContainer.state = 2
                break;
            case 2:
                baseButton.baseImage.source = state3Image
                baseButton.clickedImage.source = state3PressedImage
                triButtonContainer.state = 3
                break;
            case 3:
                baseButton.baseImage.source = state1Image
                baseButton.clickedImage.source = state1PressedImage
                triButtonContainer.state = 1
                break;
            }
            stateUpdated()
        }
    }
}
