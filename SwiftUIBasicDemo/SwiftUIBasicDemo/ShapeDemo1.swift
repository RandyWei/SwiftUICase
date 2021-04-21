//
//  ShapeDemo1.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/17.
//

import SwiftUI

struct ShapeDemo1: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 150, y: 150))
//            path.addLine(to: CGPoint(x: 100, y: 100))
            path.addArc(center: CGPoint(x: 150, y: 150), radius: 100.0, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 30), clockwise: true)
        }
    }
}

struct ShapeDemo1_Previews: PreviewProvider {
    static var previews: some View {
        ShapeDemo1()
    }
}
