//
//  UserController.swift
//  App
//
//  Created by RandyWei on 2021/3/26.
//

import Vapor

//用户相关
// 注册、登录
//
class UserController{
    func signIn(req: Request) -> String {
        let content = try? req.content.decode(SignInInput.self)
        guard let userName = content?.userName,let password = content?.password else {
            return ResponseWrapper<DefaultResponseObj>(code: .failedParamError).makeResponse()
        }
        //从数组中匹配用户，模拟数据
        let user = users.first { user -> Bool in
            user.userName == userName && user.password == password
        }
        guard var data = user else {
            return ResponseWrapper<DefaultResponseObj>(code: .failedUserError, msg: "用户名或密码错误").makeResponse()
        }
        data.password = "******"
        return ResponseWrapper(code: .success, data: data).makeResponse()
    }
    
    func signUp(req: Request) -> String {
        let content = try? req.content.decode(User.self)
        guard let userName = content?.userName,let password = content?.password, let nickName = content?.nickName else {
            return ResponseWrapper<DefaultResponseObj>(code: .failedParamError).makeResponse()
        }
        var user = users.first { user -> Bool in
            user.userName == userName
        }
        if user != nil {
            return ResponseWrapper<DefaultResponseObj>(code: .failedUserError, msg: "用户名已存在").makeResponse()
        }
        user = User(userName: userName, password: password, avatar: "", nickName: nickName)
        users.append(user!)  //将用户存入数组中，为内存存储，服务关闭即恢复
        return ResponseWrapper(code: .success, data: user).makeResponse()
    }
}

struct SignInInput:Codable {
    var userName:String
    var password:String
}
