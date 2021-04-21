//
//  SpacerDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/31.
//

import SwiftUI

struct SpacerDemo: View {
    var body: some View {
        HStack {
            Text("Left")
            Spacer()
            Text("Right1")
            Spacer()
            Text("Right2")
            Spacer()
            Text("Right3")
            Spacer(minLength: 300)
            Text("Right4")
        }
    }
}

struct SpacerDemo_Previews: PreviewProvider {
    static var previews: some View {
        SpacerDemo()
    }
}
