//
//  SliderDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/26.
//

import SwiftUI

struct SliderDemo: View {
    
    @State var sliderValue = 0.0
    
    var body: some View {
        Slider(value: $sliderValue, in: 0...100) {
            Text("Slider")
        }
    }
}

struct SliderDemo_Previews: PreviewProvider {
    static var previews: some View {
        SliderDemo()
    }
}
