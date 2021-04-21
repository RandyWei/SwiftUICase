//
//  VStackDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/30.
//

import SwiftUI

struct VStackDemo: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Text("Hello, World!")
        }.font(.title)
    }
}

struct VStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        VStackDemo()
    }
}
