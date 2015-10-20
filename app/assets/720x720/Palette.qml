import bb.cascades 1.0
import bb.system 1.0

Page {
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        
        // HEADER - START
        Container {
            layout: DockLayout {}
            horizontalAlignment: HorizontalAlignment.Fill
            topPadding: 20
            bottomPadding: 20
            minHeight: 110
            
            ImageView { // LOGO - START
                imageSource: "asset:///images/logos/logo-header.png"
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
            } // LOGO - END
        } // HEADER - END
        
        Container { // FORMAT - START
            rightPadding: 20
            bottomPadding: 20
            leftPadding: 20
            
            DropDown {
                id: ddFormat
                title: 'Format'
                options: [
                    Option { imageSource: "asset:///images/icons/format/hex.png"; text: "#1234FE"; selected: true }, 
                    Option { imageSource: "asset:///images/icons/format/hex.png"; text: "1234FE" }, 
                    Option { imageSource: "asset:///images/icons/format/rgb.png"; text: "(255, 255, 255)" }, 
                    Option { imageSource: "asset:///images/icons/format/rgba.png"; text: "(0, 0, 0, 1.0)" }, 
                    Option { imageSource: "asset:///images/icons/format/hsv.png"; text: "(360, 100, 100)" } 
                ]
                
                onExpandedChanged: {
                    if (expanded) {
                        lblCol1.visible = false
                        lblCol2.visible = false
                        lblCol3.visible = false
                        lblCol4.visible = false
                        lblCol5.visible = false
                    } else {
                        lblCol1.visible = true
                        lblCol2.visible = true
                        lblCol3.visible = true
                        lblCol4.visible = true
                        lblCol5.visible = true
                    }
                }
                
                onSelectedIndexChanged: {
                    if (selectedIndex == 0)
                        format = 'hexN'
                    else if (selectedIndex == 1)
                        format = 'hex'
                    else if (selectedIndex == 2)
                        format = 'rgb'
                    else if (selectedIndex == 3)
                        format = 'rgba'
                    else if (selectedIndex == 4)
                        format = 'hsv'
                }
            }
        } // FORMAT - END
        
        Container {
            layoutProperties: StackLayoutProperties { spaceQuota: 1 }
            horizontalAlignment: HorizontalAlignment.Fill
            
            Container {
                layout: DockLayout {}
                layoutProperties: StackLayoutProperties { spaceQuota: 1 }
                visible: (palette.length == 0)
                horizontalAlignment: HorizontalAlignment.Fill
                Label {
                    text: "<span style='font-size: 30px'><em>Palette is empty.</em></span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.Gray
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                }
            }
            
            Container { // PALETTE COLOR - START
                horizontalAlignment: HorizontalAlignment.Fill
                
                Container {
                    background: Color.create(getColor('hexN', 1))
                    layout: DockLayout {}
                    visible: (countColorsInPalette() >= 1 && countColorsInPalette() < 6)
                    layoutProperties: StackLayoutProperties { spaceQuota: countColorsInPalette() }
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    
                    Label {
                        id: lblCol1
                        text: "<span style ='font-size: 60px; font-weight: 700'>" + getColor(format, 1) + "</span>"
                        textFormat: TextFormat.Html
                        textStyle.color: Color.White
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                    }
                    
                    gestureHandlers: [
                        DoubleTapHandler {
                            onDoubleTapped: {
                                killAllToasts()
                                toastRemove1.show()
                                toastRemove1.r = palette
                                removeColor(getColor('rgb', 1))
                            }
                        }
                    ]
                    
                    attachedObjects: [
                        SystemToast {
                            id: toastRemove1
                            property string r // save palette
                            body: getColor(format, 1) + " removed from palette."
                            button.label: "Restore"
                            
                            onFinished: { if (result == SystemUiResult.ButtonSelection) { palette = r }}
                        }
                    ]
                }
                
                Container {
                    background: Color.create(getColor('hexN', 2))
                    layout: DockLayout {}
                    visible: (countColorsInPalette() >= 2 && countColorsInPalette() < 6)
                    layoutProperties: StackLayoutProperties { spaceQuota: countColorsInPalette() }
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    
                    Label {
                        id: lblCol2
                        text: "<span style ='font-size: 60px; font-weight: 700'>" + getColor(format, 2) + "</span>"
                        textFormat: TextFormat.Html
                        textStyle.color: Color.White
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                    }
                    
                    gestureHandlers: [
                        DoubleTapHandler {
                            onDoubleTapped: {
                                killAllToasts()
                                toastRemove2.show()
                                toastRemove2.r = palette
                                removeColor(getColor('rgb', 2))
                            }
                        }
                    ]
                    
                    attachedObjects: [
                        SystemToast {
                            id: toastRemove2
                            property string r // save palette
                            body: getColor(format, 2) + " removed from palette."
                            button.label: "Restore"
                            
                            onFinished: { if (result == SystemUiResult.ButtonSelection) { palette = r }}
                        }
                    ]
                }
                
                Container {
                    background: Color.create(getColor('hexN', 3))
                    layout: DockLayout {}
                    visible: (countColorsInPalette() >= 3 && countColorsInPalette() < 6)
                    layoutProperties: StackLayoutProperties { spaceQuota: countColorsInPalette() }
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    
                    Label {
                        id: lblCol3
                        text: "<span style ='font-size: 60px; font-weight: 700'>" + getColor(format, 3) + "</span>"
                        textFormat: TextFormat.Html
                        textStyle.color: Color.White
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                    }
                    
                    gestureHandlers: [
                        DoubleTapHandler {
                            onDoubleTapped: {
                                killAllToasts()
                                toastRemove3.show()
                                toastRemove3.r = palette
                                removeColor(getColor('rgb', 3))
                            }
                        }
                    ]
                    
                    attachedObjects: [
                        SystemToast {
                            id: toastRemove3
                            property string r // save palette
                            body: getColor(format, 3) + " removed from palette."
                            button.label: "Restore"
                            
                            onFinished: { if (result == SystemUiResult.ButtonSelection) { palette = r }}
                        }
                    ]
                }
                
                Container {
                    background: Color.create(getColor('hexN', 4))
                    layout: DockLayout {}
                    visible: (countColorsInPalette() >= 4 && countColorsInPalette() < 6)
                    layoutProperties: StackLayoutProperties { spaceQuota: countColorsInPalette() }
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    
                    Label {
                        id: lblCol4
                        text: "<span style ='font-size: 60px; font-weight: 700'>" + getColor(format, 4) + "</span>"
                        textFormat: TextFormat.Html
                        textStyle.color: Color.White
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                    }
                    
                    gestureHandlers: [
                        DoubleTapHandler {
                            onDoubleTapped: {
                                killAllToasts()
                                toastRemove4.show()
                                toastRemove4.r = palette
                                removeColor(getColor('rgb', 4))
                            }
                        }
                    ]
                    
                    attachedObjects: [
                        SystemToast {
                            id: toastRemove4
                            property string r // save palette
                            body: getColor(format, 4) + " removed from palette."
                            button.label: "Restore"
                            
                            onFinished: { if (result == SystemUiResult.ButtonSelection) { palette = r }}
                        }
                    ]
                }
                
                Container {
                    background: Color.create(getColor('hexN', 5))
                    layout: DockLayout {}
                    visible: (countColorsInPalette() >= 5 && countColorsInPalette() < 6)
                    layoutProperties: StackLayoutProperties { spaceQuota: countColorsInPalette() }
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    
                    Label {
                        id: lblCol5
                        text: "<span style ='font-size: 60px; font-weight: 700'>" + getColor(format, 5) + "</span>"
                        textFormat: TextFormat.Html
                        textStyle.color: Color.White
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                    }
                    
                    gestureHandlers: [
                        DoubleTapHandler {
                            onDoubleTapped: {
                                killAllToasts()
                                toastRemove5.show()
                                toastRemove5.r = palette
                                removeColor(getColor('rgb', 5))
                            }
                        }
                    ]
                    
                    attachedObjects: [
                        SystemToast {
                            id: toastRemove5
                            property string r // save palette
                            body: getColor(format, 5) + " removed from palette."
                            button.label: "Restore"
                            
                            onFinished: { if (result == SystemUiResult.ButtonSelection) { palette = r }}
                        }
                    ]
                }
            } // PALETTE COLOR - END
        }
    }
    
    actions: [ // ACTION-BAR - START
        InvokeActionItem {
            imageSource: "asset:///images/action-bar/share.png"
            title: "Share"
            query {
                mimeType: "text/plain"
                invokeActionId: "bb.action.SHARE"
            }
            onTriggered: { data = getShareString() }
        },
        
        ActionItem {
            imageSource: "asset:///images/action-bar/clear.png"
            title: "Clear Palette"
            enabled: (palette.length > 0)
            onTriggered: {
                killAllToasts()
                toastClear.show()
                
                // Store palettes temporarily to restore 
                // if user presses undo
                toastClear.r = palette
                
                // Clear palette
                palette = ''
            }
            attachedObjects: [
                SystemToast {
                    id: toastClear
                    body: "Palette cleared."
                    button.label: "Undo"
                    
                    // Properties to store palette
                    property string r
                    
                    onFinished: { if (toastClear.result == SystemUiResult.ButtonSelection) { palette = r }}
                }
            ]
        }
    ] // ACTION-BAR - END
    
    // HELPER FUNCTIONS
    function killAllToasts() {
        toastClear.cancel()
        toastRemove1.cancel()
        toastRemove2.cancel()
        toastRemove3.cancel()
        toastRemove4.cancel()
        toastRemove5.cancel()
    }
    
    // Return share message
    function getShareString() {
        if (palette.length == 0)
            return "Hey! Take a look at cooler - the perfect color palette app for designers.\nhttp://bit.ly/coolerbbw"
        return "Check out " + getConnector() + " color" + getPlural() + ": " + getAllColorsInPalette()
    }
    
    function countColorsInPalette() {
        var l = parsePalette().length
        if (l == 0)
            return 6
        return l
    }
    
    function getConnector() {
        if (countColorsInPalette() == 1)
            return 'this'
        return 'these'
    }
    
    function getPlural() {
        if (countColorsInPalette() == 1)
            return ''
        return 's'
    }
    
    function getAllColorsInPalette() {
        var count = countColorsInPalette()
        var c = ''
        
        if (count > 1)
            c += '\n'
        
        for (var i = 1 ; i <= count ; i++) {
            c += getColor(format, i)
            if (i < count)
                c += '\n'
        }
        return c
    }
    
    function parsePalette() {
        var pp
        var arr = []
        
        if (palette.length > 0) {
            // Get rid of front and end brackets
            pp = palette.substring(1, palette.length - 1)
            
            // Only one color
            if (palette.indexOf(')(') == -1) {
                arr.push(pp)
                
                // More than one color
            } else {
                // Replace all brackets with delimiter (semi-colon)
                pp = pp.replace(/\)\(/g, ';')
                
                // Split into array
                arr = pp.split(';')
            }
        }
        
        return arr
    }
    
    // Remove color from palette
    function removeColor(c) {
        var p = palette.replace(c, '')
        palette = p
    }
    
    // Get string representation of color in the given format
    function getColor(f, i) {
        var pp, arr = []
        
        if (palette.length > 0) {
            // Get rid of front and end brackets
            pp = palette.substring(1, palette.length - 1)
            
            // Only one color
            if (palette.indexOf(')(') == -1) {
                arr.push(pp)
                
                // More than one color
            } else {
                // Replace all brackets with delimiter (comma)
                pp = pp.replace(/\)\(/g, ';')
                
                // Split into array
                arr = pp.split(';')
            }
        }
        
        // To catch errors when palette is empty and is palette
        // is trying to assign colors
        if ((i - 1) >= arr.length)
            return "#000000"
        
        var c = arr[i - 1]
        
        if (f == 'hex')
            return hexify(getComponentFromRGB(c, 'r'))
            + hexify(getComponentFromRGB(c, 'g'))
            + hexify(getComponentFromRGB(c, 'b'))
        else if (f == 'hexN')
            return "#" + hexify(getComponentFromRGB(c, 'r'))
            + hexify(getComponentFromRGB(c, 'g'))
            + hexify(getComponentFromRGB(c, 'b'))
        else if (f == 'rgb')
            return "(" + c + ")"
        else if (f == 'rgba')
            return "(" + c + ", 0.1)"
        else 
            return "(" + convertRGBtoHSV(c) + ")"
    }
    
    function getComponentFromRGB(c, t) {
        var arr = c.split(", ")
        var r = parseFloat(arr[0])
        var g = parseFloat(arr[1])
        var b = parseFloat(arr[2])
        return (t == 'r') ? r : (t == 'g') ? g : b
    }
    
    function hexify(n) {
        var digits = '0123456789ABCDEF'
        var lsd = n % 16
        var msd = (n - lsd) / 16
        var hexified = digits.charAt(msd) + digits.charAt(lsd)
        return hexified
    }
    
    // RGB TO HSV
    function convertRGBtoHSV(rgb) {
        var arr = rgb.split(", ")
        var r = parseFloat(arr[0])
        var g = parseFloat(arr[1])
        var b = parseFloat(arr[2])
        
        var min = Math.min(r, g, b)
        var max = Math.max(r, g, b)
        
        var hsv, hue, sat, val
        
        // Compute value
        val = max
        if (val == 0) { // If black, set hue and saturation to 0
            hue = 0
            sat = 0
            hsv = Math.round(hue) + ', ' + Math.round(sat) + ', ' + Math.round(val)
            return hsv
        }
        
        // Normalize value
        r /= val
        g /= val
        b /= val
        min = Math.min(r, g, b)
        max = Math.max(r, g, b)
        
        // Computer saturation
        sat = max - min
        if (sat == 0) { // Saturation -> gray and arbitrarily assign hue
            hue = 0
            hsv = Math.round(hue) + ', ' + Math.round(sat) + ', ' + Math.round((val / 255) * 100)
            return hsv
        }
        
        // Normalize saturation
        r = (r - min) / (max - min)
        g = (g - min) / (max - min)
        b = (b - min) / (max - min)
        min = Math.min(r, g, b)
        max = Math.max(r, g, b)
        
        // Compute hue
        if (max == r) {
            hue = 0.0 + 60.0*(g - b)
            if (hue < 0)
                hue += 360
        } else if (max == g)
            hue = 120 + 60*(b - r)
        else
            hue = 240 + 60*(r - g)
        
        hsv = Math.round(hue) + ', ' + Math.round(sat * 100) + ', ' + Math.round((val / 255) * 100)
        return hsv
    }
    
    function setFormatDropdown() {
        var f = ''
        if (format == 'hexN')
            f = "#1234FE"
        else if (format == 'hex')
            f = "1234FE"
        else if (format == 'rgb')
            f = "(255, 255, 255)"
        else if (format == 'rgba')
            f = "(0, 0, 0, 1.0)"
        else if (format == 'hsv')
            f = "(360, 100, 100)"
        
        for (var i = 0; i < ddFormat.count(); i++) {
            var o = ddFormat.at(i)
            if(o.text == f)
                ddFormat.setSelectedIndex(i)
        }
    }
}
