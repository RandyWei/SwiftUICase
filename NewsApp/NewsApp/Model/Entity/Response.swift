//
//  Response.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/11.
//

import Foundation

struct DataResponse<T:Codable>:Codable {
    var code = 200
    var msg = ""
    var data:T?
}

struct ListResponse<T:Codable>:Codable {
    var code = 200
    var msg = ""
    var data:[T]?
}
