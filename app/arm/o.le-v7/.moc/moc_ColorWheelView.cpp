/****************************************************************************
** Meta object code from reading C++ file 'ColorWheelView.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/ColorWheelView.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ColorWheelView.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ColorWheelView[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      16,   15,   15,   15, 0x0a,
      49,   38,   15,   15, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_ColorWheelView[] = {
    "ColorWheelView\0\0onCreationCompleted()\0"
    "touchEvent\0onTouch(bb::cascades::TouchEvent*)\0"
};

void ColorWheelView::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ColorWheelView *_t = static_cast<ColorWheelView *>(_o);
        switch (_id) {
        case 0: _t->onCreationCompleted(); break;
        case 1: _t->onTouch((*reinterpret_cast< bb::cascades::TouchEvent*(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ColorWheelView::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ColorWheelView::staticMetaObject = {
    { &Container::staticMetaObject, qt_meta_stringdata_ColorWheelView,
      qt_meta_data_ColorWheelView, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ColorWheelView::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ColorWheelView::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ColorWheelView::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ColorWheelView))
        return static_cast<void*>(const_cast< ColorWheelView*>(this));
    return Container::qt_metacast(_clname);
}

int ColorWheelView::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Container::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
