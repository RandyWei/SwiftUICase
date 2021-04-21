//
//  ColorDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/16.
//

import SwiftUI

struct ColorDemo: View {
    var body: some View {
//        Color(.sRGB, red: 127/255, green: 127/255, blue: 127/255, opacity: 1)
//        LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom)
//        AngularGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center )
        RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center, startRadius: 5, endRadius: 500)
    }
}

struct ColorDemo_Previews: PreviewProvider {
    static var previews: some View {
        ColorDemo()
    }
}
