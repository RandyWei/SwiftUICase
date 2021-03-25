//
//  ImageDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/25.
//

import SwiftUI

struct ImageDemo: View {
    var body: some View {
        Image("bug_hub_logo")
            .resizable()
            .aspectRatio(2/3,contentMode: .fit)
    }
}

struct ImageDemo_Previews: PreviewProvider {
    static var previews: some View {
        ImageDemo()
    }
}
