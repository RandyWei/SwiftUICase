//
//  TextEditorDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/26.
//

import SwiftUI

struct TextEditorDemo: View {
    
    @State var text = ""
    
    var body: some View {
        TextEditor(text: $text)
    }
}

struct TextEditorDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorDemo()
    }
}
