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

#ifndef COLOR_PICKER_VIEW_H
#define COLOR_PICKER_VIEW_H

#include <bb/cascades/Container>
#include <bb/cascades/Label>

using namespace bb::cascades;

class ColorWheelView;

class Q_DECL_EXPORT ColorPickerView : public Container
{
Q_OBJECT

public slots:

    void onCreationCompleted(void);

public:

    ColorPickerView(Container * parent = 0);
    virtual ~ColorPickerView();

    void setColor(float h, float s);
    void setColor(float v);

    // http://www.cs.rit.edu/~ncs/color/t_convert.html
    void hsvToRgb(float h, float s, float v, int *r, int *g, int *b);

private:

    void setColor(float h, float s, float v);

    ColorWheelView* colorWheelView;
    Label* rgbLabel;
    Label* hexLabel;
    Container* cntrColor;

    bool creationComplete;

    float h, s, v;
};

#endif
