#include "ColorPickerView.h"
#include "ColorWheelView.h"

#include <bb/system/Clipboard>

using namespace bb::cascades;
using namespace bb::system;

ColorPickerView::ColorPickerView(Container * parent)
        : Container(parent)
{
    rgbLabel = 0;
    hexLabel = 0;
    colorWheelView = 0;
    h = s = v = 0;
    creationComplete = false;

    QObject::connect(this, SIGNAL(creationCompleted()), this, SLOT(onCreationCompleted(void)));
}

ColorPickerView::~ColorPickerView() {
    delete colorWheelView;
}

void ColorPickerView::onCreationCompleted() {
    colorWheelView = findChild<ColorWheelView*>("colorWheelView");
    rgbLabel = findChild<Label*>("rgbLabel");
    hexLabel = findChild<Label*>("hexLabel");
    cntrColor = findChild<Container*>("cntrColor");

    creationComplete = true;

    setColor(h, s, v);
}

void ColorPickerView::setColor(float v)
{
    this->v = v;
    setColor(h, s, v);
}

void ColorPickerView::setColor(float h, float s)
{
    this->h = h;
    this->s = s;
    setColor(h, s, v);
}

void ColorPickerView::setColor(float h, float s, float v)
{
    if (!creationComplete) return;

    int r, g, b;
    hsvToRgb(h, s, v, &r, &g, &b);

    cntrColor->setBackground(Color::fromARGB(qRgb(r, g, b)));

    QString rgbStr = QString("%1, %2, %3").arg(r).arg(g).arg(b);
    rgbLabel->setText(rgbStr);

    QString hexStr;
    hexStr.setNum(qRgb(r, g, b), 16);
    hexLabel->setText(hexStr.toUpper());
}

void ColorPickerView::hsvToRgb(float h, float s, float v, int *r, int *g, int *b)
{
    if (s == 0) {
        // achromatic (grey)
        *r = *g = *b = v;
        return;
    }

    h /= 60; // sector 0 to 5

    int i = floor(h);
    float f = h - i; // factorial part of h
    float p = v * (1 - s);
    float q = v * (1 - s * f);
    float t = v * (1 - s * (1 - f));

    switch (i) {
        case 0:
            *r = v, *g = t, *b = p;
            break;
        case 1:
            *r = q, *g = v, *b = p;
            break;
        case 2:
            *r = p, *g = v, *b = t;
            break;
        case 3:
            *r = p, *g = q, *b = v;
            break;
        case 4:
            *r = t, *g = p, *b = v;
            break;
        default:
            *r = v, *g = p, *b = q;
            break;
    }
}
