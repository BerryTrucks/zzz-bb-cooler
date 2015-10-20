#include "LightnessBarView.h"
#include "ColorPickerView.h"

#include <bb/cascades/AbsoluteLayout>
#include <bb/cascades/AbsoluteLayoutProperties>
#include <bb/cascades/Color>
#include <bb/cascades/Container>

#include <time.h>

using namespace bb::cascades;

LightnessBarView::LightnessBarView(Container* parent)
        : Container(parent)
{
    ivCursor = 0;

    QObject::connect(this, SIGNAL(creationCompleted()), this, SLOT(onCreationCompleted(void)));
    QObject::connect(this, SIGNAL(touch(bb::cascades::TouchEvent*)), this, SLOT(onTouch(bb::cascades::TouchEvent*)));
}

LightnessBarView::~LightnessBarView()
{
}

void LightnessBarView::onCreationCompleted()
{
    colorPickerView = (ColorPickerView*) parent()->parent();
    ivCursor = findChild<ImageView*>("ivCursor");
    barImageView = findChild<ImageView*>("barImageView");

    fillSelectorSquare();
    fillLightnessBar();

    srand(time(0));

    int randX = rand() % (int) barImageView->preferredWidth();

    AbsoluteLayoutProperties* wheelLayout = dynamic_cast<AbsoluteLayoutProperties*>(barImageView->layoutProperties());

    randX += wheelLayout->positionX();

    selectBrightness(0);
}

void LightnessBarView::onTouch(bb::cascades::TouchEvent* touchEvent) {
    float x = touchEvent->localX();

    AbsoluteLayoutProperties* barLayout = dynamic_cast<AbsoluteLayoutProperties*>(barImageView->layoutProperties());

    float positionX = barLayout->positionX();
    float width = barImageView->preferredWidth();

    if (x < positionX || x >= positionX + width) {
        return;
    }

    selectBrightness(x);
}

void LightnessBarView::fillLightnessBar() {
    float width = preferredWidth();
    float height = preferredHeight();

    barImageData = bb::ImageData(bb::PixelFormat::RGBA_Premultiplied, width, height);
    int stride = barImageData.bytesPerLine();
    unsigned char* pixels = barImageData.pixels();
    bzero(pixels, sizeof(unsigned char) * stride * height);

    for (int x = 0; x < width; x++)
    {
        for (int y = 0; y < height; y++)
        {
            float v = 255 - (((x + 1) / width) * 255);

            int p = (y * stride) + (x * 4);
            pixels[p + 0] = v;
            pixels[p + 1] = v;
            pixels[p + 2] = v;
            pixels[p + 3] = 255;
        }
    }

    barImageView->setImage(Image(barImageData));
}

void LightnessBarView::fillSelectorSquare() {
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
            pixels[p + 0] = 231;
            pixels[p + 1] = 76;
            pixels[p + 2] = 60;
            pixels[p + 3] = 255;
        }
    }

    ivCursor->setImage(Image(imageData));
}

void LightnessBarView::selectBrightness(float x) {
    AbsoluteLayoutProperties* selectorLayout = dynamic_cast<AbsoluteLayoutProperties*>(ivCursor->layoutProperties());

    AbsoluteLayoutProperties* barlayout =
            dynamic_cast<AbsoluteLayoutProperties*>(barImageView->layoutProperties());

    float imageViewWidth = barImageView->preferredWidth();
    float imageViewX = barlayout->positionX();

    float selectorWidth = ivCursor->preferredWidth();
    float selectorX = x - (0.50 * selectorWidth);
    selectorX = fmax(imageViewX + 1, fmin(selectorX, (imageViewX + imageViewWidth) - (selectorWidth + 1)));

    selectorLayout->setPositionX(selectorX);
    selectorLayout->setPositionY(0.50 * (preferredHeight() - ivCursor->preferredHeight()));

    x -= barlayout->positionX();

    const unsigned char* pixels = barImageData.constPixels();

    int p = x * 4;
    int v = pixels[p];

    colorPickerView->setColor(v);
}
