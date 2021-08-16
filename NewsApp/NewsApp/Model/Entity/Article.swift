//
//  Article.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/29.
//

import Foundation

struct Article:Codable,Identifiable {
    var id:String
    var title:String
    var mediaName:String
    var publishTime:String
    var content:String
}

extension Article {
    static func mock(id: String,title:String) -> Article{
        Article(id: id, title: title, mediaName: "来源：官方发布", publishTime: "2020-08-12 00:00:00", content: "")
    }
}
