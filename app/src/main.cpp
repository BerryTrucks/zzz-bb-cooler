#include <bb/cascades/Application>

#include "ColorWheelApp.h"

using namespace bb::cascades;

Q_DECL_EXPORT int main(int argc, char **argv)
{
    Application app(argc, argv);
    ColorWheelApp mainApp;

    // Start the application event loop (run-loop).
    return Application::exec();
}
