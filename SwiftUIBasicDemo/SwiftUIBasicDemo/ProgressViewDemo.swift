//
//  ProgressViewDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/26.
//

import SwiftUI

struct ProgressViewDemo: View {
    var body: some View {
        ProgressView("progress", value: 0.5, total: 1)
            .progressViewStyle(LinearProgressViewStyle())
    }
}

struct ProgressViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewDemo()
    }
}
