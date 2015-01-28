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
