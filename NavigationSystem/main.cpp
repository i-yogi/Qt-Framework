#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "mywindow.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<MyWindow>("mycustomlib", 1, 0, "MyWindow");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
