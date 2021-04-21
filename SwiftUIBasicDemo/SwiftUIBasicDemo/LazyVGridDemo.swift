//
//  LazyVGridDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/13.
//

import SwiftUI

struct LazyVGridDemo: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.fixed(20)),GridItem(.fixed(20))], content: {
                Text("Placeholder1Placeholder1Placeholder1Placeholder1Placeholder1Placeholder1Placeholder1").background(Color.yellow)
                Text("Placeholder2Placeholder2Placeholder2Placeholder2Placeholder2").background(Color.green)
                Text("Placeholder1Placeholder1Placeholder1Placeholder1Placeholder1Placeholder1Placeholder1").background(Color.blue)
                Text("Placeholder1Placeholder1Placeholder1Placeholder1Placeholder1Placeholder1Placeholder1").background(Color.red)
            })
        }.navigationTitle("LazyVGridDemo")
    }
}

struct LazyVGridDemo_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridDemo()
    }
}
