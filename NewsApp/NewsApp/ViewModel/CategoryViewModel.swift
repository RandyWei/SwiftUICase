//
//  CategoryViewModel.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/11.
//

import Foundation

class CategoryViewModel: ObservableObject {
    
    private var service = CategoryService()
    
    //分类数据
    @Published private(set) var categories: [Category] = Array(repeating: .mock, count: 4)
    //分类数据是否加载完成
    @Published private(set) var loaded: Bool = false
    
    
    //类型数据
    @Published private(set) var types = ["相关资讯","视频课程"]
    
    
    init() {
        list()
    }
    
    private func list() {
        service.list { (datas:[Category]?, msg, code) in
            guard let result = datas else {
                return
            }
            self.categories = result
            self.loaded = true
        }
    }
}
