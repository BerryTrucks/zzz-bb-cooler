/* Copyright (c) 2013 Martin M Reed
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef COLOR_WHEEL_VIEW_H
#define COLOR_WHEEL_VIEW_H

#include <bb/cascades/Container>
#include <bb/cascades/ImageView>

#include <bb/ImageData>

using namespace bb::cascades;

class ColorPickerView;

class Q_DECL_EXPORT ColorWheelView : public Container
{
Q_OBJECT

public slots:

    void onCreationCompleted(void);
    void onTouch(bb::cascades::TouchEvent* touchEvent);

public:

    ColorWheelView(Container * parent = 0);
    virtual ~ColorWheelView();

private:

    void fillColorWheel();
    void fillSelectorCircle();

    void selectColor(float x, float y);

    ColorPickerView* colorPickerView;
    ImageView* wheelImageView;
    ImageView* ivCursor;

    bb::ImageData wheelImageData;
};

#endif
