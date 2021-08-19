//
//  VideoDetail.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/20.
//

import SwiftUI
import AVKit

struct VideoDetail: View {
    
    @StateObject private var videoVM = VideoViewModel()
    
    var videoId:String
    var title:String
    
    @State var webViewContentHeight:CGFloat = 0
    
    var body: some View {
        
        var avPlayer:AVPlayer? = nil
        if let url = URL(string: videoVM.videoUrl) {
            avPlayer = AVPlayer(url: url)
        }
        
        return VStack{
            
            VideoPlayer(player: avPlayer)
                .aspectRatio(16/9, contentMode: .fit)
            
            ScrollView{
                LazyVStack{
                    Text("\(title)")
                        .font(Font.system(size: 16))
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity,alignment: .leading)
                    
                    Color.gray.opacity(0.3).frame(height: 10)
                    
                    WebView(htmlString: videoVM.videoDesc,scrollHeight: $webViewContentHeight)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: webViewContentHeight)
                }
            }
            
        }
        .navigationTitle("详情")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            videoVM.info(videoId: videoId)
        }
    }
}

struct VideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetail(videoId: "", title: "")
    }
}
