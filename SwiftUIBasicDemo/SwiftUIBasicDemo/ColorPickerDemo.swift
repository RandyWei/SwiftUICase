//
//  ColorPickerDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/30.
//

import SwiftUI

struct ColorPickerDemo: View {
    
    @State var selection:Color = Color.white
    
    var body: some View {
        ColorPicker("Color", selection: $selection)
    }
}

struct ColorPickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerDemo()
    }
}
