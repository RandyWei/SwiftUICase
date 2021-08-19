//
//  VideoModel.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/30.
//

import Foundation

struct VideoModel:Codable,Identifiable {
    var id:String
    var title:String
    var duration:String
    var imgUrl:String
    var video:String //视频地址
    var desc:String //简介
}


extension VideoModel {
    static func mock(id: String,title:String) -> VideoModel{
        VideoModel(id: id, title: title, duration: "00:00:00", imgUrl: "", video: "", desc: "")
    }
}
