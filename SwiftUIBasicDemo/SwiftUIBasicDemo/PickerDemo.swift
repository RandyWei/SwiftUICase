//
//  PickerDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/30.
//

import SwiftUI

struct PickerDemo: View {
    
    @State var selection:PickerItem = PickerItem.Kotlin
    
    var body: some View {
        VStack {
            Picker("请选择语言", selection: $selection) {
                Text("Kotlin").tag(PickerItem.Kotlin)
                Text("Swift").tag(PickerItem.Swift)
                Text("Dart").tag(PickerItem.Dart)
            }
//            .pickerStyle(SegmentedPickerStyle())
//            Text("当前选中的是：\(selection)")
        }
    }
}

enum PickerItem {
    case Kotlin
    case Swift
    case Dart
}

struct PickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        PickerDemo()
    }
}
