//
//  VideoModel.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/30.
//

import Foundation

struct VideoModel:Decodable,Identifiable {
    var id:String
    var title:String
    var duration:String
    var imgUrl:String
}
