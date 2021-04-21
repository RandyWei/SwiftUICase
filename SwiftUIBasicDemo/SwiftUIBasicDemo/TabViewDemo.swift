//
//  TabViewDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/16.
//

import SwiftUI

struct TabViewDemo: View {
    
    @State var selection = 0
    
    var body: some View {
        VStack{
            TabView(selection: $selection) {
                Color.yellow
                    .tabItem {
                        Label(
                            title: { Text("yellow") },
                            icon: { Image(systemName: "42.circle") })
                    }
                    .tag(0)
                Color.blue
                .tabItem {
                    Label(
                        title: { Text("blue") },
                        icon: { Image(systemName: "42.circle") })
                }
                    .tag(1)
                Color.green
                .tabItem {
                    Label(
                        title: { Text("green") },
                        icon: { Image(systemName: "42.circle") })
                }
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            Text("1111:\(selection)")
        }
    }
}

struct TabViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabViewDemo()
    }
}
