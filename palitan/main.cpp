//#include <QGuiApplication>
//#include <QQmlApplicationEngine>
//#include <QQuickView>

//int main(int argc, char *argv[])
//{
//    QGuiApplication app(argc, argv);

//    QQuickView view;
//    view.setSource(QUrl(QStringLiteral("qrc:///Main.qml")));
//    view.setResizeMode(QQuickView::SizeRootObjectToView);
//    view.show();
//    return app.exec();
//}

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QQuickStyle>
#include <QDebug>

int main(int argc, char *argv[])
{
    /*qputenv("QT_SCALE_FACTOR", "3");*/

    QGuiApplication::setApplicationName("Palitan");
    QGuiApplication::setOrganizationName("palitan.kugiigi");
    QGuiApplication::setApplicationName("palitan.kugiigi");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QSettings settings;
    QString style = QQuickStyle::name();
    if (settings.contains("style")) {
        QQuickStyle::setStyle(settings.value("style").toString());
    }
    else {
        settings.setValue("style", "Suru");
        QQuickStyle::setStyle("Suru");
    }

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("availableStyles", QQuickStyle::availableStyles());
    engine.load(QUrl(QStringLiteral("qrc:///Main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
