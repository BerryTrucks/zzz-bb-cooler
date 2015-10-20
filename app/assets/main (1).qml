import bb.cascades 1.0

TabbedPane {
    property string palette: ''
    property string format: 'hexN'
    
    Menu.definition: MenuDefinition {
        actions: [
            ActionItem {
                title: "About"
                imageSource: "asset:///images/action-bar/info.png" 
                onTriggered: { 
                    var pane = setNavPane()
                    var page = aboutDef.createObject()
                    pane.push(page)
                }
                
                attachedObjects: [
                    ComponentDefinition {
                        id: aboutDef
                        source: 'pages/menu/about.qml'
                    }
                ]
            },
            
            ActionItem {
                title: "Help"
                imageSource: "asset:///images/action-bar/help.png" 
                onTriggered : { 
                    var pane = setNavPane()
                    var page = helpDef.createObject()
                    pane.push(page)
                }
                
                attachedObjects: [
                    ComponentDefinition {
                        id: helpDef
                        source: 'pages/menu/help.qml'
                    }
                ]
            }
        ]
    }
    
    showTabsOnActionBar: true

    Tab {
        id: tabColor
        imageSource: "asset:///images/action-bar/color.png"
        title: "Color Picker"
        onTriggered: { navPaneC.firstPage.setFormatDropdown() }
        NavigationPane {
            id: navPaneC
            ColorWheel {}
            onPopTransitionEnded: { 
                page.destroy()
                Application.menuEnabled = true
            }
        }
    }
    
    Tab {
        id: tabPalette
        imageSource: "asset:///images/action-bar/palette.png"
        title: "Palette"
        onTriggered: { navPaneP.firstPage.setFormatDropdown() }
        NavigationPane {
            id: navPaneP
            Palette {}
            onPopTransitionEnded: { 
                page.destroy()
                Application.menuEnabled = true
            }
        }
    }
    
    // HELPER FUNCTIONS
    function setNavPane() {
        if (activeTab == tabColor)
            return navPaneC
        else if (activeTab == tabPalette)
            return navPaneP
    }
}