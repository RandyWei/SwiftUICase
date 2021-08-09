//
//  ResponseWrapper.swift
//  App
//
//  Created by RandyWei on 2021/3/26.
//

import Vapor

class ResponseWrapper<T:Codable>: Codable {
    private var code: ApiCode!
    private var msg: String = ""
    private var data: T?
    
    init(code: ApiCode) {
        self.code = code
        self.msg = code.getMsg()
    }
    
    init(data: T) {
        self.code = ApiCode.success
        self.data = data
        self.msg = ApiCode.success.getMsg()
    }
    
    init(code: ApiCode , data: T) {
        self.code = code
        self.msg = ApiCode.success.getMsg()
        self.data = data
    }
    
    init(code: ApiCode, msg: String) {
        self.code = code
        self.msg = msg
    }
    
    func makeResponse() -> String {
        var result = ""
        
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(self)
            result = String(data: data, encoding: .utf8)!
        } catch {
            print("Encode error")
        }
        return result
    }
    
    func makeFutureResponse(req: Request) -> EventLoopFuture<String> {
        let promise = req.eventLoop.makePromise(of: String.self)
        
        var result = ""
        
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(self)
            result = String(data: data, encoding: .utf8)!
        } catch {
            print("Encoder error")
        }
        promise.succeed(result)
        
        return promise.futureResult
    }
}
