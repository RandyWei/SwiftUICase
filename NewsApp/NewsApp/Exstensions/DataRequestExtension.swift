//
//  DataRequestExstension.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/11.
//

import Foundation
import Alamofire

extension DataRequest{
    func json<T: Codable>(completion: @escaping ListCompletion<T>) {
        self.responseJSON { response in
            debugPrint(response)
            do{
                let decoder = JSONDecoder()
                
                guard let data = response.data else {
                    completion(nil,"数据为空,解析异常",1000)
                    return
                }
                
                let result = try decoder.decode(ListResponse<T>.self, from: data)
                
                completion(result.data,result.msg,result.code)
            }catch{
                completion(nil,"解析异常",1000)
            }
        }
    }
}
