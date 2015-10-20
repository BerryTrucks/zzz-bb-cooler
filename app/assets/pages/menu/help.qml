import bb.cascades 1.0

Page {
    property Page page
    
    onCreationCompleted: { Application.menuEnabled = false }
    
    Container { // WRAPPER - START
        // HEADER - START
        Container {
            background: Color.create("#222222")
            layout: DockLayout {}
            horizontalAlignment: HorizontalAlignment.Fill
            
            topPadding: 26
            bottomPadding: 26
            
            Container {
                leftPadding: 40
                verticalAlignment: VerticalAlignment.Center
                Label {
                    text: "<span style='font-size: 60px'>Help</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White
                }
            }
            
            Container {
                horizontalAlignment: HorizontalAlignment.Right
                rightPadding: 40
                ImageView {
                    imageSource: "asset:///images/logos/logo-header.png"
                    gestureHandlers: [ TapHandler { onTapped: { var pane = setNavPane(); pane.pop(); activeTab = tabColor }}]
                }
            }
        } // HEADER - END
        
        Container {
            background: Color.create("#333333")
            horizontalAlignment: HorizontalAlignment.Fill
            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
            
            topPadding: 20
            rightPadding: 20
            bottomPadding: 20
            leftPadding: 20
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                topPadding: 20
                rightPadding: 20
                bottomPadding: 20
                leftPadding: 20
                
                ImageButton { 
                    minWidth: 150
                    defaultImageSource: "asset:///images/icons/social/twitter.png"
                    attachedObjects: [
                        Invocation {
                            id: twitterInvoke
                            query {
                                mimeType: "text/html"
                                uri: "http://twitter.com/karelvuong"
                            }
                        }
                    ]
                    onClicked: {
                        twitterInvoke.trigger("bb.action.OPEN")
                    }
                }
                
                Container {
                    leftPadding: 20
                    Label {
                        text: "<span style='font-size: 30px;'>If you need any help, send me a tweet and I try my best to assist you in any way I can.</span>"
                        textFormat: TextFormat.Html
                        textStyle.color: Color.White   
                        textStyle.fontStyle: FontStyle.Italic
                        multiline: true
                    }
                    
                    Label {
                        text: "<span style='font-size: 30px;'>@karelvuong</span>"
                        textFormat: TextFormat.Html
                        textStyle.color: Color.White   
                        textStyle.fontWeight: FontWeight.Bold
                    }
                }
            }
        } // HEADER - END
        
        // BODY - START
        Container {
            layout: DockLayout {}
            layoutProperties: StackLayoutProperties { spaceQuota: 1 }
            horizontalAlignment: HorizontalAlignment.Fill
            
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                
                Label {
                    text: "<span style='font-size: 40px;'>Select a color.</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White   
                    textStyle.fontWeight: FontWeight.W100
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                Label {
                    text: "<span style='font-size: 40px;'>Double-tap it at the bottom\nto add it to your palette.</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White   
                    textStyle.fontWeight: FontWeight.W100
                    textStyle.textAlign: TextAlign.Center
                    multiline: true
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                Label {
                    text: "<span style='font-size: 40px;'>Share it with your friends.</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White   
                    textStyle.fontWeight: FontWeight.W100
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                Container {
                    topPadding: 40
                    horizontalAlignment: HorizontalAlignment.Center
                    ImageView {
                        imageSource: "asset:///images/icons/help/emoticon-cool.png"
                    }
                }
                
                Label {
                    text: "<span style='font-size: 50px; letter-spacing: 2px'>Stay cool.</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.White   
                    textStyle.fontWeight: FontWeight.Bold
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
        } // BODY - END
    } // WRAPPER - END
    
    // HELPER FUNCTIONS
    function setNavPane() {
        if (activeTab == tabColor)
            return navPaneC
        else if (activeTab == tabPalette)
            return navPaneP
    }
}