import bb.cascades 1.0

Page {
    onCreationCompleted: { Application.menuEnabled = false }
    
    // MAIN CONTENT - START
    Container {
        layout: DockLayout {}
        
        ImageView {
            imageSource: "asset:///images/cover/cover.jpg"
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
        }
        
        Container {
            topPadding: 60
            horizontalAlignment: HorizontalAlignment.Center
            ImageView { imageSource: "asset:///images/logos/logo-about.png" }
        }
        
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Top
            
            topPadding: 320
            Label {
                text: "<span style='font-size: 50px'>cooler colours</span>"
                textFormat: TextFormat.Html
                textStyle.color: Color.Black
                textStyle.fontWeight: FontWeight.W100
            }
        }
        
        Container {
            layout: StackLayout { orientation: LayoutOrientation.LeftToRight }
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            
            topPadding: 380
            bottomPadding: 20
            
            Container {  
                ImageButton { 
                    defaultImageSource: "asset:///images/icons/social/behance.png"
                    onClicked: { behanceInvoke.trigger("bb.action.OPEN") }
                    attachedObjects: [
                        Invocation {
                            id: behanceInvoke
                            query {
                                mimeType: "text/html"
                                uri: "http://behance.com/karelvuong"
                            }
                        }
                    ]
                }
            }
            
            Container {
                leftPadding: 20
                ImageButton { 
                    defaultImageSource: "asset:///images/icons/social/dribbble.png"
                    onClicked: { dribbbleInvoke.trigger("bb.action.OPEN") }
                    attachedObjects: [
                        Invocation {
                            id: dribbbleInvoke
                            query {
                                mimeType: "text/html"
                                uri: "http://dribbble.com/karelvuong"
                            }
                        }
                    ]
                }
            }
            
            Container {
                leftPadding: 20
                ImageButton { 
                    defaultImageSource: "asset:///images/icons/social/mail.png"
                    onClicked: { mailInvoke.trigger("bb.action.SENDEMAIL") }
                    attachedObjects: [
                        Invocation {
                            id: mailInvoke
                            query {
                                //id: invokeQuery
                                uri: "mailto:karelvuongg@gmail.com?subject=cooler - Just Wanted To Say Hello"
                                invokeActionId: "bb.action.SENDEMAIL"
                                invokeTargetId: "sys.pim.uib.email.hybridcomposer"
                            }
                        }
                    ]
                }
            }
            
            Container {
                leftPadding: 20
                ImageButton { 
                    defaultImageSource: "asset:///images/icons/social/twitter.png"
                    onClicked: { twitterInvoke.trigger("bb.action.OPEN") }
                    attachedObjects: [
                        Invocation {
                            id: twitterInvoke
                            query {
                                mimeType: "text/html"
                                uri: "http://twitter.com/karelvuong"
                            }
                        }
                    ]
                }
            }
        }
    } // MAIN CONTENT - END
    
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
    ] //ACTIONBAR - END
}