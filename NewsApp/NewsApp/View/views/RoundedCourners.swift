//
//  RoundedCorners.swift
//  AppDemo
//
//  Created by RandyWei on 2021/3/4.
//

import SwiftUI

struct RoundedCorners<Content: ShapeStyle>: View {
    
    private let defaultRadius: CGFloat = 10.0
    
    private var tl: CGFloat = 0.0 // top-left radius
    private var tr: CGFloat = 0.0 // top-right radius
    private var bl: CGFloat = 0.0 //bottom-left radius
    private var br: CGFloat = 0.0 // bottom-right radius
    
    private var background: Content
    
    init() {
        tl = defaultRadius
        tr = defaultRadius
        bl = defaultRadius
        br = defaultRadius
        
        self.background = Color.black as! Content
    }
    
    init(top: CGFloat = 0.0, bottom: CGFloat = 0.0, background: Content = Color.black as! Content) {
        tl = top
        tr = top
        
        bl = bottom
        br = bottom
        
        self.background = background
    }
    
    init(topLeft: CGFloat = 0.0,topRight: CGFloat = 0.0, bottomLeft: CGFloat = 0.0, bottomRight: CGFloat = 0.0, background: Content = Color.black as! Content) {
        tl = topLeft
        tr = topRight
        bl = bottomLeft
        br = bottomRight
        self.background = background
    }
    
    var body: some View {
        GeometryReader{ geometry in
            Path{ path in
                let w = geometry.size.width
                let h = geometry.size.height
                
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            }
            .fill(background)
            
        }
    }
}

struct RoundedCorners_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCorners(top: 10.0, background: LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .frame(width: 200,height: 200)
            .previewLayout(PreviewLayout.fixed(width: 300, height: 300))
    }
}
