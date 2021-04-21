//
//  ZStackDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/30.
//

import SwiftUI

struct ZStackDemo: View {
    var body: some View {
        ZStack(alignment:.topLeading) {
            
            Image("bug_hub_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("watermark")
                .foregroundColor(Color.red)
            
        }.padding()
    }
}

struct ZStackDemo_Previews: PreviewProvider {
    static var previews: some View {
        ZStackDemo()
    }
}
