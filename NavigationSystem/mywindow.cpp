#include "mywindow.h"

#include <QDebug>

MyWindow::MyWindow() : QQuickWindow()
{

}

void MyWindow::mouseMoveEvent(QMouseEvent *e)
{
//    qDebug() << "My Custom Click Event!";
    QQuickWindow::mouseMoveEvent(e);
}

void MyWindow::mousePressEvent(QMouseEvent *e)
{
//    qDebug() << "My Custom Click Event!";
    QQuickWindow::mousePressEvent(e);
}

void MyWindow::mouseDoubleClickEvent(QMouseEvent *e)
{
    qDebug() << "Double Click Event!";
    QQuickWindow::mouseDoubleClickEvent(e);
}

void MyWindow::mouseReleaseEvent(QMouseEvent *e)
{
//    qDebug() << "My Custom Click Event!";
    QQuickWindow::mouseReleaseEvent(e);
}

void MyWindow::touchEvent(QTouchEvent *e)
{  
    qDebug() << "My Custom Touch Event!";
    QQuickWindow::touchEvent(e);
}


