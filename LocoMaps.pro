#///////////////////////////////////////////////////////////////////////////////
#//  This document created by:
#//  CyberData Corporation
#//  1327 South Puget Drive, #F24
#//  Renton WA 98055
#//  +1 (206) 715-7628
#//  Lloyd@CyberData-Robotics.com
#//
#//  Spatial Minds, LLC
#//  304 E. Highland Ave
#//  Mount Vernon, WA 98273
#//  +1 (206) 962-7754
#//  craig.miller@spatialminds.com
#//
#//  Copyright (c) 2012, CyberData Corporation
#//  Copyright (c) 2012, Spatial Minds, LLC
#//  All Rights Reserved
#//
#//  CONFIDENTIAL AND PROPRIETARY INFORMATION
#//  WHICH IS THE PROPERTY OF CyberData Corporation and Spatial Minds, LLC
#////////////////////////////////////////////////////////////////////////////////

# Add files and directories to ship with the application 
# by adapting the examples below.
# file1.source = myfile
# dir1.source = mydir
QT += core gui declarative
CONFIG += mobility
MOBILITY += location

DEPLOYMENTFOLDERS = # file1 dir1

symbian:TARGET.UID3 = 0xEF12C15B

# Smart Installer package's UID
# This UID is from the protected range 
# and therefore the package will fail to install if self-signed
# By default qmake uses the unprotected range value if unprotected UID is defined for the application
# and 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices

# If your application uses the Qt Mobility libraries, uncomment
# the following lines and add the respective components to the 
# MOBILITY variable. 
# CONFIG += mobility
# MOBILITY +=

SOURCES += main.cpp mainwindow.cpp
HEADERS += mainwindow.h
FORMS +=

# Please do not modify the following two lines. Required for deployment.
include(deployment.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/ui.qml \
    qml/GeoMap.qml \
    qml/Floater.qml \
    qml/Button.qml \
    img/gps_pressed.svg \
    qml/MapZoomer.qml \
    img/zoomer_18_pressed.svg \
    img/zoomer_17_pressed.svg \
    img/zoomer_16_pressed.svg \
    img/zoomer_15_pressed.svg \
    img/zoomer_14_pressed.svg \
    img/zoomer_13_pressed.svg \
    img/zoomer_12_pressed.svg \
    img/zoomer_11_pressed.svg \
    img/zoomer_10_pressed.svg \
    img/zoomer_9_pressed.svg \
    img/zoomer_8_pressed.svg \
    img/zoomer_7_pressed.svg \
    img/zoomer_6_pressed.svg \
    img/zoomer_5_pressed.svg \
    img/zoomer_4_pressed.svg \
    img/zoomer_3_pressed.svg \
    img/zoomer_2_pressed.svg \
    img/zoomer_1_pressed.svg \
    img/zoomer_18.svg \
    img/zoomer_17.svg \
    img/zoomer_16.svg \
    img/zoomer_15.svg \
    img/zoomer_14.svg \
    img/zoomer_13.svg \
    img/zoomer_12.svg \
    img/zoomer_11.svg \
    img/zoomer_10.svg \
    img/zoomer_9.svg \
    img/zoomer_8.svg \
    img/zoomer_7.svg \
    img/zoomer_6.svg \
    img/zoomer_5.svg \
    img/zoomer_4.svg \
    img/zoomer_3.svg \
    img/zoomer_2.svg \
    img/zoomer_1.svg \
    img/zoomer_0.svg \
    img/terrain_pressed.svg \
    img/terrain.svg \
    img/streets_pressed.svg \
    img/streets.svg \
    img/satellite_pressed.svg \
    img/satellite.svg \
    qml/TriButton.qml \
    img/zoomer_18_pressed_up.svg \
    img/zoomer_18_pressed_down.svg \
    img/zoomer_17_pressed_up.svg \
    img/zoomer_17_pressed_down.svg \
    img/zoomer_16_pressed_up.svg \
    img/zoomer_16_pressed_down.svg \
    img/zoomer_15_pressed_up.svg \
    img/zoomer_15_pressed_down.svg \
    img/zoomer_14_pressed_up.svg \
    img/zoomer_14_pressed_down.svg \
    img/zoomer_13_pressed_up.svg \
    img/zoomer_13_pressed_down.svg \
    img/zoomer_12_pressed_up.svg \
    img/zoomer_12_pressed_down.svg \
    img/zoomer_11_pressed_up.svg \
    img/zoomer_11_pressed_down.svg \
    img/zoomer_10_pressed_up.svg \
    img/zoomer_10_pressed_down.svg \
    img/zoomer_9_pressed_up.svg \
    img/zoomer_9_pressed_down.svg \
    img/zoomer_8_pressed_up.svg \
    img/zoomer_8_pressed_down.svg \
    img/zoomer_7_pressed_up.svg \
    img/zoomer_7_pressed_down.svg \
    img/zoomer_6_pressed_up.svg \
    img/zoomer_6_pressed_down.svg \
    img/zoomer_5_pressed_up.svg \
    img/zoomer_5_pressed_down.svg \
    img/zoomer_4_pressed_up.svg \
    img/zoomer_4_pressed_down.svg \
    img/zoomer_3_pressed_up.svg \
    img/zoomer_3_pressed_down.svg \
    img/zoomer_2_pressed_up.svg \
    img/zoomer_2_pressed_down.svg \
    img/zoomer_1_pressed_up.svg \
    img/zoomer_1_pressed_down.svg \
    img/zoomer_0_pressed_up.svg \
    img/zoomer_0_pressed_down.svg

RESOURCES += \
    resources.qrc
