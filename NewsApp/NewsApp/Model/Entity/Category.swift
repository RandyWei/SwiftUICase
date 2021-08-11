//
//  Category.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/11.
//

import Foundation

struct Category:Codable {
    var id:String
    var name:String
}

extension Category{
    static let mock = Category(id: UUID().uuidString, name: "分类数据")
}
