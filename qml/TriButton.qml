///////////////////////////////////////////////////////////////////////////////
//  This document created by:
//  CyberData Corporation
//  1327 South Puget Drive, #F24
//  Renton WA 98055
//  +1 (206) 715-7628
//  Lloyd@CyberData-Robotics.com
//
//  Spatial Minds, LLC
//  304 E. Highland Ave
//  Mount Vernon, WA 98273
//  +1 (206) 962-7754
//  craig.miller@spatialminds.com
//
//  Copyright (c) 2012, CyberData Corporation
//  Copyright (c) 2012, Spatial Minds, LLC
//  All Rights Reserved
//
//  CONFIDENTIAL AND PROPRIETARY INFORMATION
//  WHICH IS THE PROPERTY OF CyberData Corporation and Spatial Minds, LLC
////////////////////////////////////////////////////////////////////////////////

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
