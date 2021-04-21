//
//  VideoDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/17.
//

import SwiftUI
import AVKit

struct VideoDemo: View {
    
    let avPlaer = AVPlayer(url: URL(string: "https://look.chinahrt.com.cn/courseyun/rxsl2content/transcode/20211/be3b6935-f678-4303-a1f8-b2a006352656/283006-mp4.mp4")!)
    
    var body: some View {
        VideoPlayer(player: avPlaer) {
            Text("水印")
        }.aspectRatio(16/9,contentMode: .fit)
    }
}

struct VideoDemo_Previews: PreviewProvider {
    static var previews: some View {
        VideoDemo()
    }
}
