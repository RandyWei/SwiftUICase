//
//  LinkDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/26.
//

import SwiftUI

struct LinkDemo: View {
    var body: some View {
        Link("www.baidu.com", destination: URL(string: "https://www.baidu.com")!)
    }
}

struct LinkDemo_Previews: PreviewProvider {
    static var previews: some View {
        LinkDemo()
    }
}
