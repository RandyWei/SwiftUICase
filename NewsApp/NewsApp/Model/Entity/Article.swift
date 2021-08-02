//
//  Article.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/29.
//

import Foundation

struct Article:Decodable,Identifiable {
    var id:String
    var title:String
    var mediaName:String
    var publishTime:String
    var content:String
}
