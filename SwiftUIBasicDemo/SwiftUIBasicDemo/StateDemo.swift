//
//  StateDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/17.
//

import SwiftUI

struct StateDemo: View {
    @State private var count: Int = 0
    var body: some View {
        VStack {
            Text("episode.title")
            Text("episode.showTitle:\(count)")
            PlayButton(count: $count)
        }
    }
}

struct PlayButton: View {
    @Binding var count: Int

    var body: some View {
        Button(action: {
            count += 1
        }) {
            Image(systemName: "plus")
        }
    }
}

struct StateDemo_Previews: PreviewProvider {
    static var previews: some View {
        StateDemo()
    }
}
