//
//  VideoViewModel.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/18.
//

import SwiftUI
import AVKit

class VideoViewModel: ObservableObject {
    
    private let service = VideoService()
    
    //文章列表数据
    @Published private(set) var videoList: [VideoModel] = Array(generating: { index in
        .mock(id: UUID().uuidString, title: String(repeating: "视频标题", count: Int.random(in: 5...15)))
    }, count: 10)
    
    //列表数据是否加载完成
    @Published private(set) var listLoaded = false
    
    //视频路径
    @Published private(set) var videoUrl:String = ""
    
    //视频简介
    @Published private(set) var videoDesc:String = ""
    
    init() {
        list()
    }
    
    private func list(){
        service.list { (result:[VideoModel]?, msg, code) in
            guard let data = result else {
                return
            }
            self.listLoaded = true
            self.videoList = data
        }
    }
    
    func info(videoId:String) {
        service.info(id: videoId) { (result:VideoModel?, msg, code) in
            guard let data = result else {
                return
            }
            //视频地址
            self.videoUrl = data.video
            //构造详情
            self.videoDesc =
                """
                \(htmlHeader)
                <div class="videoContainer">\(data.desc)</div>
                \(htmlFooter)
                """
        }
    }
    
    
}
