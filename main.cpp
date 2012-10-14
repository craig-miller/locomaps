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

#include "mainwindow.h"

#include <QtGui/QApplication>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    MainWindow mainWindow(app.desktop());
    mainWindow.setOrientation(MainWindow::ScreenOrientationAuto);
    mainWindow.showExpanded();

    return app.exec();
}
