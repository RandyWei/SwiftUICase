//
//  Video.swift
//  swfitDemo001
//
//  Created by RandyWei on 2021/2/25.
//

import Foundation

struct VideoJsonWrapper:Codable {
    var data: [Video]
}

struct DataWrapper:Codable {
    var videos:[Video]
}

struct Video:Codable {
    var name: String
    var typeid:String
    var cover:String
}

struct Video4App:Codable {
    var title:String
    var imgUrl:String
    var duration:String
    var id:String
    var video:String
    var desc:String
}
