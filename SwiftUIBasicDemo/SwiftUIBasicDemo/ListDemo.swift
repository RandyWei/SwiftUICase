//
//  ListDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/31.
//

import SwiftUI

struct ListDemo: View {
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        List {
            Text("Header")
            ForEach(0..<20){
                Text("Text\($0)")
            }
            Text("Footer")
        }
        .frame(width: screen.width)
    }
}

struct ListDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListDemo()
    }
}
