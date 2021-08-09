//
//  CategoryController.swift
//  App
//
//  Created by RandyWei on 2021/3/30.
//

import Foundation
import Vapor

class CategoryController {
    func list(req: Request) -> String {
        let list = [
            Category(id: "0", name: "思想政治"),
            Category(id: "1", name: "法律法规"),
            Category(id: "2", name: "职业道德"),
            Category(id: "3", name: "诚信自律")
        ]
        return ResponseWrapper(code: .success, data: list).makeResponse()
    }
}
