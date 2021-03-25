//
//  TextDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/24.
//

import SwiftUI

struct TextDemo: View {
    var body: some View {
        Text(Image(systemName: "person")) + Text("Hello, World!")
            .underline()
        + Text("12345")
    }
}

struct TextDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextDemo()
    }
}
