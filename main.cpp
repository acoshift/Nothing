#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QResource>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Nothing");
    app.setOrganizationDomain("Nothing");
    app.setApplicationName("Nothing");

#ifdef Q_OS_ANDROID
    QResource::registerResource("assets:/bgm01.rcc");
    QResource::registerResource("assets:/bgm02.rcc");
    QResource::registerResource("assets:/bgm03.rcc");
    QResource::registerResource("assets:/bgm04.rcc");
    QResource::registerResource("assets:/bgm05.rcc");
    QResource::registerResource("assets:/bgm06.rcc");
    QResource::registerResource("assets:/bgm07.rcc");
    QResource::registerResource("assets:/resources.rcc");
#else
    QResource::registerResource("bgm01.rcc");
    QResource::registerResource("bgm02.rcc");
    QResource::registerResource("bgm03.rcc");
    QResource::registerResource("bgm04.rcc");
    QResource::registerResource("bgm05.rcc");
    QResource::registerResource("bgm06.rcc");
    QResource::registerResource("bgm07.rcc");
    QResource::registerResource("resources.rcc");
#endif

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("qrc:/"));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
