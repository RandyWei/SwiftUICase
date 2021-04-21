//
//  ToggleDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/26.
//

import SwiftUI

struct ToggleDemo: View {
    
    @State var isOn:Bool = false
    
    var body: some View {
        Toggle("是否开启移动网络下载", isOn: $isOn)
    }
}

struct ToggleDemo_Previews: PreviewProvider {
    static var previews: some View {
        ToggleDemo()
    }
}
