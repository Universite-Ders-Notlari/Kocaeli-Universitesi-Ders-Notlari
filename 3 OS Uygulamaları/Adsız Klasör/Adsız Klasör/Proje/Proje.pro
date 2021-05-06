#-------------------------------------------------
#
# Project created by QtCreator 2016-05-11T00:42:38
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Proje
TEMPLATE = app
INCLUDEPATH +=/usr/local/include/opencv
LIBS += -L/usr/local/lib -lopencv_core -lopencv_imgcodecs -lopencv_highgui -lopencv_objdetect -lopencv_features2d -lopencv_imgproc -lopencv_ml



SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h

FORMS    += mainwindow.ui
