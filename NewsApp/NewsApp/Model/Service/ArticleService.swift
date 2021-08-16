//
//  ArticleService.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/12.
//

import Foundation
import Alamofire

struct ArticleService {
    func list<T: Codable>(offset:Int, completion: @escaping ListCompletion<T>) {
        AF.request("http://172.27.25.85:8080/article/list?offset=\(offset)").json(completion: completion)
    }
    
    func info<T: Codable>(id:String, completion: @escaping DataCompletion<T>) {
        AF.request("http://172.27.25.85:8080/article/info?id=\(id)").json(completion: completion)
    }
}
