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

/*!
  Zoom Control QML Component

  Provides a graphical tool for setting the zoom level of the GeoMap control

  \property zoomLevel The current zoom level of the control [0-19]
  \signal zoomLevelChanged Callback triggered when the user changes the zoom level
*/

// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: container

    property real zoomLevel: 0
    signal zoomLevelChanged()

    function updateZoomImage(level, state, up_dn)
    {
        var fileName = "qrc:/img/zoomer_" + level
        if(state) {
            if(up_dn)
            {
                fileName = fileName + "_pressed_up.svg"
            }
            else
            {
                fileName = fileName + "_pressed_down.svg"
            }
        }
        else {
            fileName = fileName + ".svg"
        }
        zoomImage.source = fileName
    }

    Image {
        id: zoomImage
        anchors.fill: parent
        source: "qrc:/img/zoomer_0.svg"
    }

    MouseArea {
        id: zoomIn
        x: 0
        y: 0
        width: parent.width
        height: parent.height / 2
        onPressed: {
            updateZoomImage(zoomLevel, true, true)
        }

        onReleased: {
            if(zoomLevel < 18) zoomLevel++
            updateZoomImage(zoomLevel, false, true)
            zoomLevelChanged()
        }
    }

    MouseArea {
        id: zoomOut
        x: 0
        y: parent.height / 2
        width: parent.width
        height: parent.height / 2
        onPressed: {
            updateZoomImage(zoomLevel, true,false)
        }

        onReleased: {
            if(zoomLevel > 0) zoomLevel--
            updateZoomImage(zoomLevel, false, false)
            zoomLevelChanged()
        }
    }

    Component.onCompleted: {
        updateZoomImage(zoomLevel, false);
    }

}
