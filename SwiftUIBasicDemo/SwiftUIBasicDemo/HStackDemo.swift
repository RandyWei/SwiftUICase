//
//  HStackDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/30.
//

import SwiftUI

struct HStackDemo: View {
    var body: some View {
        HStack() {
            ForEach(0..<4) {
                Text("11111\($0)")
            }
        }
        .font(.title)
    }
}

struct HStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        HStackDemo()
    }
}
