#ifndef MYWINDOW_H
#define MYWINDOW_H

#include <QQuickWindow>

class MyWindow : public QQuickWindow
{

    //Macro - since this class declares its own SIGNALS and SLOTS for Events
        Q_OBJECT

public:
    MyWindow();

protected:
    virtual void mouseMoveEvent(QMouseEvent *e) Q_DECL_OVERRIDE;
    virtual void mousePressEvent(QMouseEvent *e) Q_DECL_OVERRIDE;
    virtual void mouseReleaseEvent(QMouseEvent *e) Q_DECL_OVERRIDE;
    virtual void mouseDoubleClickEvent(QMouseEvent *e) Q_DECL_OVERRIDE;

    virtual void touchEvent(QTouchEvent *e) Q_DECL_OVERRIDE;
};

#endif
