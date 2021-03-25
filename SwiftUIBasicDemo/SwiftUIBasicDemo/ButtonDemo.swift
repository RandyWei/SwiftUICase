//
//  ButtonDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/25.
//

import SwiftUI

struct ButtonDemo: View {
    var body: some View {
//        Button("登录") {
//            print("======")
//        }
        Button(action: {
            print("======")
        }, label: {
            Text("Button")
        })
    }
}

struct ButtonDemo_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemo()
    }
}
