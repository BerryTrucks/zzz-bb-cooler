#include "ColorWheelApp.h"

#include <bb/cascades/AbstractPane>
#include <bb/cascades/Application>
#include <bb/cascades/Container>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/SceneCover>
#include <bb/system/Clipboard>

#include <screen/screen.h>

#include "ColorPickerView.h"
#include "ColorWheelView.h"
#include "LightnessBarView.h"

using namespace bb::cascades;

ColorWheelApp::ColorWheelApp() {

    qmlRegisterType<ColorPickerView>("colorwheel", 1, 0, "ColorPickerView");
    qmlRegisterType<ColorWheelView>("colorwheel", 1, 0, "ColorWheelView");
    qmlRegisterType<LightnessBarView>("colorwheel", 1, 0, "LightnessBarView");

    QmlDocument *qml = QmlDocument::create("asset:///main.qml");

    if (qml->hasErrors()) {
        exit(-1);
        return;
    }

    QmlDocument *qmlCover = QmlDocument::create("asset:///pages/cover.qml").parent(this);

    if (!qmlCover->hasErrors()) {
        // Create the QML Container from using the QMLDocument.
        Container *coverContainer = qmlCover->createRootObject<Container>();

        // Create a SceneCover and set the application cover
        SceneCover *sceneCover = SceneCover::create().content(coverContainer);
        Application::instance()->setCover(sceneCover);
    }

    // Creates the root node object as defined in main.qml
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    Application::instance()->setScene(root);
}

ColorWheelApp::~ColorWheelApp()
{}
