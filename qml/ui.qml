/*
   Locomaps - Locomaps is touchscreen tablet application for browsing the maps,
   satellite data, and terrain data available from Nokia's Mapping Services.

   © Copyright 2012 Spatial Minds, LLC. All Rights Reserved.
     craig.miller@spatialminds.com

   © Copyright 2012 CyberData Corporation. All Rights Reserved.
     lloyd@cyberdata-robotics.com
  
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
