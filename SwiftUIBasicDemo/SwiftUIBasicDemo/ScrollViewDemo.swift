//
//  ScrollViewDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/13.
//

import SwiftUI

struct ScrollViewDemo: View {
    var body: some View {
        ScrollViewReader { proxy in
            VStack{
                ScrollView(.horizontal){
                    HStack{
                        ForEach(0..<50){
                            Text("Hello, World!:\($0)")
                                .frame(height: 100)
                                .background(Color.yellow)
                                .id($0)
                        }
                    }
                }
                Button("跳转到第5个") {
//                    proxy.scrollTo(10)
                    withAnimation {
                        proxy.scrollTo(10, anchor: .trailing)
                    }
                }
            }
        }
    }
}

struct ScrollViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewDemo()
    }
}
