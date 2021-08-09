//
//  ApiCode.swift
//  App
//
//  Created by RandyWei on 2021/3/26.
//

enum ApiCode: Int, Codable {
    case unknow = 0
    
    case success = 200
    
    case failedParamError = 400
    
    case failedUserError = 10010
    
    func getMsg() -> String {
        return "\(self)"
    }
    
    func getCode() -> Int {
        return self.rawValue
    }
}
