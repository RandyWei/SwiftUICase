//
//  NavigationDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/15.
//

import SwiftUI

struct NavigationDemo: View {
    
    @State var isActive = false
    @State var count = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0 ..< 15) { item in
                    NavigationLink(
                        destination: LazyVGridDemo(),
                        label: {
                            Text("跳到 LazyVGridDemo")
                                .frame(height: 300)
                        })
                }
            }
            .navigationTitle("Title")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Leading")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        NavigationLink(
                            destination: Text("Destination"),
                            isActive: $isActive,
                            label: {})
                        Button("Navigate") {
                            if count == 2 {
                                isActive.toggle()
                            }
                            count += 1
                        }
                    }
                }
                ToolbarItem(placement: .status) {
                    Text("status")
                }
            })
        }
    }
}

struct NavigationDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDemo()
    }
}
