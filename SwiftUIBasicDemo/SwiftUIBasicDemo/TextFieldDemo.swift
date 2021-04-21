//
//  TextFieldDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/26.
//

import SwiftUI

struct TextFieldDemo: View {
    
    @State var username:String = ""
    
    var body: some View {
        TextField("username", text: $username) { (isEditing) in
            print("\(isEditing)")
        } onCommit: {
            print("onCommit")
        }

            
    }
}

struct TextFieldDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDemo()
    }
}
