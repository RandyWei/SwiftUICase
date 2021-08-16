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
            
            LazyVGrid(columns: [GridItem(.fixed(120)),GridItem(.fixed(120))], content: {
                ForEach(0..<10){
                    Text("Placeholder\($0)").background(Color.yellow)
                }
            })
            
        }.navigationTitle("LazyVGridDemo")
    }
}

struct LazyVGridDemo_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridDemo()
    }
}
