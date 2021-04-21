//
//  ScrollViewDemo1.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/13.
//

import SwiftUI

struct ScrollViewDemo1: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(1...100, id: \.self) { item in
                    Text("Row \(item)").onAppear {
                        print("LazyVStack onAppear Row \(item)")
                    }
                    .onDisappear{
                        print("LazyVStack onDisappear Row \(item)")
                    }
                }
            }
        }
        
//        ScrollView {
//            VStack(alignment: .leading) {
//                ForEach(1...100, id: \.self) { item in
//                    Text("Row \(item)").onAppear {
//                        print("VStack onAppear Row \(item)")
//                    }
//                    .onDisappear{
//                        print("VStack onDisappear Row \(item)")
//                    }
//
//                }
//            }
//        }
    }
}

struct ScrollViewDemo1_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewDemo1()
    }
}
