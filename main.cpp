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
