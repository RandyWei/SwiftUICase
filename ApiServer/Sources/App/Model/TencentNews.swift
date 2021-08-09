//
//  TencentNews.swift
//  App
//
//  Created by RandyWei on 2021/3/29.
//

import Foundation
struct TencentNews: Codable {
    var cms_id:String
    var title:String
    var media_name:String
    var publish_time:String
}

struct TencentNewsData: Decodable {
    var list:[TencentNews]
}

struct TencentNewsRootNode: Decodable {
    var ret:Int
    var msg:String
    var data:TencentNewsData
}
