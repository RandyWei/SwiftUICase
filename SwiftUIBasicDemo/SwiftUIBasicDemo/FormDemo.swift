//
//  FormDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/31.
//

import SwiftUI

struct FormDemo: View {
    
    @State var text = ""
    
    var body: some View {
        Form {
            Section(header: Text("Header0")){
                HStack{
                    Text("Content")
                    TextField("Label",text: $text)
                }
                Text("Content1")
            }
            
            Section(header: Text("Header1"), footer: Text("Footer")) {
                HStack{
                    Text("Content")
                    TextField("Label",text: $text)
                }
                Text("Content1")
            }
            
            Group{
                Text("Group 1")
                Text("Group 2")
            }
        }
    }
}

struct FormDemo_Previews: PreviewProvider {
    static var previews: some View {
        FormDemo()
    }
}
