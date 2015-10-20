import bb.cascades 1.0

Container {
    layout: DockLayout {}
    
    ImageView {
        imageSource: "asset:///images/cover/cover.jpg"
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
    }
    
    ImageView {
        imageSource: "asset:///images/logos/logo-about.png"
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
    }
}