//
//  ShapeDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/16.
//

import SwiftUI

struct ShapeDemo: View {
    @State var text:String = ""
    var body: some View {
//        RoundedRectangle(cornerRadius: 25.0).frame(width: 100, height: 100, alignment: .center)
//        Rectangle().foregroundColor(Color.yellow)
//        Circle()
//        Ellipse()
        Capsule().frame(width: 200, height: 100, alignment: .center)
    }
}

struct ShapeDemo_Previews: PreviewProvider {
    static var previews: some View {
        ShapeDemo()
    }
}
