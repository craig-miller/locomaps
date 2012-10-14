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
  Main UI QML Code

  This is the main QML code for the UI of LocoMaps.
  It first sets up a GeoMap and then displays a set of controls on top of the map
*/

import Qt 4.7
import QtQuick 1.0
import QtMobility.location 1.2

Item {

    id:  containingScreen
    anchors.fill: parent

    GeoMap {
        id:  geoMap;
        anchors.fill:  parent
        centerOnGPS: false
        mapType: Map.TerrainMap
    }

    Button {
        id: gpsButton
        x: geoMap.width - 150
        y: 10
        width: 124
        height: 124
        latching: true
        baseImage.source: "qrc:/img/gps.svg"
        clickedImage.source: "qrc:/img/gps_pressed.svg"
        onButtonClicked: {
            geoMap.centerOnGPS = gpsButton.latched
        }
    }

    TriButton {
        id: mapTypeSelector
        x: geoMap.width - 150
        y: 140
        width: 124
        height: 124
        state1Image: "qrc:/img/terrain.svg"
        state1PressedImage: "qrc:/img/terrain_pressed.svg"
        state2Image: "qrc:/img/streets.svg"
        state2PressedImage: "qrc:/img/streets_pressed.svg"
        state3Image: "qrc:/img/satellite.svg"
        state3PressedImage: "qrc:/img/satellite_pressed.svg"
        onStateUpdated: {
            switch( mapTypeSelector.state) {
                case 2:
                    geoMap.mapType = Map.TerrainMap
                    break;
                case 3:
                    geoMap.mapType = Map.StreetMap
                    break;
                case 1:
                    geoMap.mapType = Map.SatelliteMapDay
                    break;
            }
        }
    }

    MapZoomer {
        id: zoomTool
        x: geoMap.width - 142
        y: 270
        height: 344
        width: 110
        zoomLevel:  geoMap.zoomLevel
        onZoomLevelChanged: geoMap.zoomLevel = zoomTool.zoomLevel
    }
}
