//
//  SecureField.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/26.
//

import SwiftUI

struct SecureFieldDemo: View {
    
    @State var password = ""
    
    var body: some View {
        SecureField("password", text: $password)
    }
}

struct SecureField_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldDemo()
    }
}
