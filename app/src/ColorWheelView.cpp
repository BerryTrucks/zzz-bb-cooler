#include "ColorWheelView.h"
#include "ColorPickerView.h"

#include <bb/cascades/AbsoluteLayoutProperties>
#include <bb/cascades/Container>
#include <bb/cascades/Color>
#include <bb/cascades/AbsoluteLayout>

#include <time.h>

using namespace bb::cascades;

float distance(float x1, float y1, float x2, float y2);

ColorWheelView::ColorWheelView(Container* parent)
	: Container(parent)
{
    ivCursor = 0;
    wheelImageView = 0;

    QObject::connect(this, SIGNAL(creationCompleted()), this, SLOT(onCreationCompleted(void)));
    QObject::connect(this, SIGNAL(touch(bb::cascades::TouchEvent*)), this, SLOT(onTouch(bb::cascades::TouchEvent*)));
}

ColorWheelView::~ColorWheelView() {}

void ColorWheelView::onCreationCompleted() {
    colorPickerView = (ColorPickerView*) parent();
    ivCursor = findChild<ImageView*>("ivCursor");
    wheelImageView = findChild<ImageView*>("wheelImageView");

    fillSelectorCircle();
    fillColorWheel();

    // RANDOMIZES COLOR ON START UP
    srand(time(0));

    float radius = 0.5 * wheelImageView->preferredWidth();
    float distance = rand() % (int) radius;
    float radian = (rand() % 360) * (180 / M_PI);

    int randX = radius + round(distance * cos(radian));
    int randY = radius + round(distance * sin(radian));

    AbsoluteLayoutProperties* wheelLayout = dynamic_cast<AbsoluteLayoutProperties*>(wheelImageView->layoutProperties());

    randX += wheelLayout->positionX();
    randY += wheelLayout->positionY();

    selectColor(randX, randY);
}

void ColorWheelView::onTouch(bb::cascades::TouchEvent* touchEvent) {
    float x = touchEvent->localX();
    float y = touchEvent->localY();

    AbsoluteLayoutProperties* wheelLayout = dynamic_cast<AbsoluteLayoutProperties*>(wheelImageView->layoutProperties());

    int radius = 0.50 * wheelImageView->preferredWidth();
    float centerX = wheelLayout->positionX() + radius;
    float centerY = wheelLayout->positionY() + radius;

    if (distance(x, y, centerX, centerY) > radius) {
        return;
    }

    selectColor(x, y);
}

void ColorWheelView::fillColorWheel() {
    float width = preferredWidth() - 1;
    float height = preferredHeight() - 1;
    int radius = (int) fmin(width / 2, height / 2);

    wheelImageData = bb::ImageData(bb::PixelFormat::RGBA_Premultiplied, width, height);
    int stride = wheelImageData.bytesPerLine();
    unsigned char* pixels = wheelImageData.pixels();
    bzero(pixels, sizeof(unsigned char) * stride * height);

    for (int radi = radius; radi >= 0; radi--)
    {
        for (float radian = 0; radian < 2 * M_PI; radian += .001)
        {
            float angle = radian * (180 / M_PI);
            int x = radius + round(radi * cos(radian));
            int y = radius + round(radi * sin(radian));

            int r, g, b;
            colorPickerView->hsvToRgb(angle, radi / (float) radius, 255, &r, &g, &b);

            int p = (y * stride) + (x * 4);
            pixels[p + 0] = r;
            pixels[p + 1] = g;
            pixels[p + 2] = b;
            pixels[p + 3] = 255;
        }
    }

    wheelImageView->setImage(Image(wheelImageData));
}

void ColorWheelView::fillSelectorCircle() {
    float width = ivCursor->preferredWidth() - 1;
    float height = ivCursor->preferredHeight() - 1;
    int radius = (int) fmin(width / 2, height / 2);

    bb::ImageData imageData = bb::ImageData(bb::PixelFormat::RGBA_Premultiplied, width, height);
    int stride = imageData.bytesPerLine();
    unsigned char* pixels = imageData.pixels();
    bzero(pixels, sizeof(unsigned char) * stride * height);

    for (int radi = radius; radi >= radius - 1; radi--)
    {
        for (float radian = 0; radian < 2 * M_PI; radian += .001)
        {
            int x = radius + round(radi * cos(radian));
            int y = radius + round(radi * sin(radian));

            int p = (y * stride) + (x * 4);
            pixels[p + 0] = 0;
            pixels[p + 1] = 0;
            pixels[p + 2] = 0;
            pixels[p + 3] = 255;
        }
    }

    ivCursor->setImage(Image(imageData));
}

float distance(float x1, float y1, float x2, float y2) {
    return sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
}

void ColorWheelView::selectColor(float x, float y) {
    AbsoluteLayoutProperties* selectorLayout = dynamic_cast<AbsoluteLayoutProperties*>(ivCursor->layoutProperties());

    selectorLayout->setPositionX(x - (0.50 * ivCursor->preferredWidth()));
    selectorLayout->setPositionY(y - (0.50 * ivCursor->preferredHeight()));

    AbsoluteLayoutProperties* wheelLayout = dynamic_cast<AbsoluteLayoutProperties*>(wheelImageView->layoutProperties());

    float radius = 0.50 * wheelImageView->preferredWidth();
    float centerX = wheelLayout->positionX() + radius;
    float centerY = wheelLayout->positionY() + radius;

    int _x = x - centerX;
    int _y = y - centerY;

    float angle = atan2(_y, _x) * (180 / M_PI);
    angle = (int) (angle + 360) % 360;

    float s = distance(x, y, centerX, centerY) / radius;

    colorPickerView->setColor(angle, s);
}
