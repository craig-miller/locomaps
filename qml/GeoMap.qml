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
  Touchscreen Friendly Map QML Component
  Supports:  Flickable panning, zoom in/out, center on current location, displaying POIs by category
  Magic Numbers:
    6378137  = World Mercator Projection spheroid's radius in meters

  See the QML Mobility Location Module 'Map' component documentation for property descriptions
  \property connectivityMode Connectivity mode used to fetch the map data (Map.OfflineMode, Map.OnlineMode, Map.HybridMode)
  \property mapType Type of Map to display (Map.StreetMap, Map.SatelliteMapDay, Map.SatelliteMapNight, Map.TerrainMap)
  \property maximumZoomLevel Maximum valid zoom level for the map.
  \property minimumZoomLevel Minimum valid zoom level for the map.
  \fn objects List of Objects associated with the map (MapRectangle, MapCircle, MapText, etc)
  \property size Size of the map viewport
  \property zoomLevel Current zoom level for the map.  Larger values provide more detail
  \fn setCenterLatLon(lat, lon) Set map position by WGS84 Lat/Lon
  \fn setCenterImgXY(px, py) Set map position using map image pixel coordinates
 */

// TODO:  Implement pinchable zoom in/out

import Qt 4.7
import QtMobility.location 1.2

Item {
    id: container

    // Public properties
    // See QML Mobility 1.2 Location Module Map docs
    property alias mapType:  map.mapType
    property alias size: map.size
    property bool centerOnGPS
    property alias zoomLevel: map.zoomLevel

    //Private properties
    property real centerLat: 0
    property real centerLon: 0

    onZoomLevelChanged:
    {
        flickable.contentWidth = Math.pow(2, map.zoomLevel) * 256   // Image width in pixels
        flickable.contentHeight =  flickable.contentWidth						  // Spherical Mercator is square

        setCenterLatLonCoord(map.center);
    }


    // Public - Set map position by WGS84 Lat/Lon
    function setCenterLatLonCoord(latLon) {

        flickable.contentX = map.lonToX(latLon.longitude);
        flickable.contentY = map.latToY(latLon.latitude);

        map.center = latLon;

    }

    // Public - Set map position using map image pixel coordinates.
    function setCenterImgXY(px, py) {
        var lon = map.xToLon(px);
        var lat = map.yToLat(py);
        var coord = map.latLonToMapCoord(lat, lon);
        map.center = coord;
    }

    // GPS
    PositionSource {
        id: positionSource
        updateInterval: 1000
        active: true
        nmeaSource: "file:/log.nmea"
        onPositionChanged: {
            //console.log("position changed:" + position.coordinate.longitude + "," +position.coordinate.latitude);
            if (centerOnGPS == true)
            {
                centerLat = position.coordinate.latitude
                centerLon = position.coordinate.longitude
                var coord = map.latLonToMapCoord(centerLat,centerLon);
                geoMap.setCenterLatLonCoord(coord);
            }
        }
    }

    Map {
        id: map
        objectName: "centralMap"
        anchors.fill: parent
        // Type of Map to display (Map.StreetMap, Map.SatelliteMapDay, Map.SatelliteMapNight, Map.TerrainMap)
        // mapType:  Map.StreetMap
        // mapType:  Map.TerrainMap
        mapType:  Map.SatelliteMapDay
        // mapType:  Map.SatelliteMapNight   // Same as SatelliteMapDay

        //mapType:  Map.HybridMap  			  // Not enabled.  Defaults to StreetMap
        //mapType:  Map.TransitMap 			  // Not enabled.  Defaults to StreetMap
        //mapType:  Map.GrayStreetMap 		  // Not enabled.  Defaults to StreetMap
        //mapType:  Map.MobileStreetMap      // Not enabled.  Defaults to StreetMap.
        //mapType:  Map.MobileTerrainMap     // Not enabled.  Defaults to StreetMap
        //mapType:  Map.MobileHybridMap      // Not enabled.  Defaults to StreetMap
        //mapType:  Map.MobileTransitMap	  // Not enabled.  Defaults to StreetMap
        //mapType:  Map.MobileGrayStreetMap  // Not enabled.  Defaults to StreetMap

        z : 1
        zoomLevel: 12

        plugin : Plugin {
            name : "nokia"
        }

        MapImage {
            source:  "qrc:/img/DirectionlessRed.svg"
            coordinate: positionSource.position.coordinate;
            offset.x:  -16;
            offset.y:  -8;
            z: 10
        }

        // Determine the resolution at the current map zoom level
        function resolution() {
            var initialResolution = 2.0 * Math.PI * 6378137.0 / 256.0;
            return initialResolution / Math.pow(2.0, zoomLevel);
        }

        // Returns a Geo Coordinate object from a pair of separate lat/lon ordinates
        function latLonToMapCoord(lat, lon) {
            var coord = Qt.createQmlObject('import QtMobility.location 1.1; Coordinate{latitude:' + lat + ';longitude:' + lon + ';}', container, "coord");
            return coord
        }

        // Map image pixel coordinate to geographic Lat/Lon coordinate
        function toGeoCoord(pt) {
            var lat = yToLat(pt.y);
            var lon = xToLon(pt.x);

            return latLonToMapCoord(lat,lon)
        }

        // Map image pixel x ordinate to geographic longitude ordinate
        function xToLon(px) {
            var res = map.resolution();
            var originShift = 2 * Math.PI * 6378137 / 2.0;
            var mx = px * res - originShift;
            var lon = (mx / originShift) * 180.0;
            return lon;
        }

        // Map image pixel y ordinate to geographic latitude ordinate
        function yToLat(py) {
            var res = map.resolution();
            var originShift = 2 * Math.PI * 6378137 / 2.0;
            var my = py * res - originShift;
            var lat = (my / originShift) * 180.0;
            lat = 180 / Math.PI * (2 * Math.atan( Math.exp ( lat * Math.PI / 180.0)) - Math.PI / 2.0);
            return lat;
        }

        // Geographic longitude ordinate to map image pixel x-axis ordinate
        function lonToX(lon) {
            var res = map.resolution();
            var originShift = 2 * Math.PI * 6378137 / 2.0;
            var mx = lon * originShift / 180.0;
            var px = Math.round ((mx + originShift) / res);

            return px;
        }

        // Geographic latitude ordinate to map image pixel y-axis ordinate
        function latToY(lat) {
            var res = map.resolution();
            var originShift = 2 * Math.PI * 6378137 / 2.0;
            var my = Math.log( Math.tan((90 - lat) * Math.PI / 360.0 )) / (Math.PI / 180.0);
            my = my * originShift / 180.0;
            var py = Math.round ((my + originShift) / res);
            return py;
        }
    }

    Flickable {
        id: flickable
        anchors.fill: parent
        contentWidth: Math.pow(2, map.zoomLevel) * 256; // Image width in pixels
        contentHeight: contentWidth                     // Google World Mercator projection is square (on spheroid)
        onContentXChanged: setCenterImgXY(contentX, flickable.contentHeight - contentY)
        onContentYChanged: setCenterImgXY(contentX, flickable.contentHeight - contentY)
    }


    Component.onCompleted: {

        if (positionSource.position.longitudeValid && positionSource.position.latitudeValid) {
            setCenterLatLonCoord(positionSource.position.coordinate);
        }
        else {
            centerLat = 47.601765;
            centerLon = -122.33367;

            var coord = map.latLonToMapCoord(centerLat,centerLon);
            setCenterLatLonCoord(coord);
        }
    }
}
