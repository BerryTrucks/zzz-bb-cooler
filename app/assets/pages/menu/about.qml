import bb.cascades 1.0

Page {
    onCreationCompleted: { Application.menuEnabled = false }
    
    // BODY - START
    Container {
        layout: DockLayout {}
        ImageView {
            imageSource: "asset:///images/cover/cover.jpg"
            horizontalAlignment: HorizontalAlignment.Center
        }
        Container {
            topPadding: 100
            horizontalAlignment: HorizontalAlignment.Center
            ImageView { 
                imageSource: "asset:///images/logos/logo-about.png"
                horizontalAlignment: HorizontalAlignment.Center
            }
            
            Container {
                topPadding: 20
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    text: "<span style='font-size: 35px; font-weight: 700; letter-spacing: 2px'>cooler colors.</span>"
                    textFormat: TextFormat.Html
                    textStyle.color: Color.Black
                    textStyle.textAlign: TextAlign.Center
                }
            }
        }
        
        Container {
            layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            
            topPadding: 350
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                
                bottomPadding: 20
                
                Container {  
                    ImageButton {
                        defaultImageSource: "asset:///images/icons/social/behance.png"
                        attachedObjects: [
                            Invocation {
                                id: behanceInvoke
                                query {
                                    mimeType: "text/html"
                                    uri: "http://behance.com/karelvuong"
                                }
                            }
                        ]
                        onClicked: { behanceInvoke.trigger("bb.action.OPEN") }
                    }
                }
                
                Container {
                    leftPadding: 20
                    ImageButton { 
                        defaultImageSource: "asset:///images/icons/social/dribbble.png"
                        attachedObjects: [
                            Invocation {
                                id: dribbbleInvoke
                                query {
                                    mimeType: "text/html"
                                    uri: "http://dribbble.com/karelvuong"
                                }
                            }
                        ]
                        onClicked: { dribbbleInvoke.trigger("bb.action.OPEN") }
                    }
                }
            }
            
            Container {
                layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                
                Container {
                    ImageButton { 
                        defaultImageSource: "asset:///images/icons/social/mail.png"
                        attachedObjects: [
                            Invocation {
                                id: mailInvoke
                                query {
                                    //id: invokeQuery
                                    uri: "mailto:karelvuongg@gmail.com?subject=cella - Just Wanted To Say Hello"
                                    invokeActionId: "bb.action.SENDEMAIL"
                                    invokeTargetId: "sys.pim.uib.email.hybridcomposer"
                                }
                            }
                        ]
                        onClicked: { mailInvoke.trigger("bb.action.SENDEMAIL") }
                    }
                }
                
                Container {
                    leftPadding: 20
                    ImageButton { 
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
                        onClicked: { twitterInvoke.trigger("bb.action.OPEN") }
                    }
                }
            }
        }
        
        Container {
            bottomPadding: 30
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Bottom
            Label {
                text: "<span style='font-size: 30px; letter-spacing: 2px;'>@karelvuong</span>"
                textFormat: TextFormat.Html
                textStyle.color: Color.Black
            }
        }
    } // BODY - END
    
    // ACTIONBAR - START
    actions: [
        InvokeActionItem {
            title: "Review"
            imageSource: "asset:///images/action-bar/review.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            query.mimeType: "text/plain"
            query.invokeTargetId: "sys.appworld"
            query.invokeActionId: "bb.action.OPEN"
            query.uri: "appworld://content/36801887"
        },
        
        InvokeActionItem {
            title: "Share"
            imageSource: "asset:///images/action-bar/share.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            query {
                mimeType: "text/plain"
                invokeActionId: "bb.action.SHARE"
            }
            onTriggered: { data = "Hey! Take a look at cooler - the perfect color palette app for designers.\nhttp://bit.ly/coolerbbw" }
        }
    ]
}