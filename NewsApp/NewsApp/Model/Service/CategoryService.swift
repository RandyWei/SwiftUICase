//
//  CategoryService.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/11.
//

import Foundation
import Alamofire

struct CategoryService {
    
    func list<T: Codable>(completion: @escaping ListCompletion<T>) {
        AF.request("http://172.27.25.85:8080/category/list").json(completion: completion)
    }
    
}
