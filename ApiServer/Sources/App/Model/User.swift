//
//  User.swift
//  App
//
//  Created by RandyWei on 2021/3/26.
//

import Foundation
struct User: Codable {
    var userName:String
    var password:String
    var avatar:String
    var nickName:String
}

var users = [
    User(userName: "lilei", password: "670b14728ad9902aecba32e22fa4f6bd", avatar: "https://c-ssl.duitang.com/uploads/item/201901/17/20190117092809_ffwKZ.thumb.1000_0.jpeg",nickName: "李雷"),
    User(userName: "hanmeimei", password: "e10adc3949ba59abbe56e057f20f883e", avatar: "http://pic.17qq.com/img_qqtouxiang/86384007.jpeg",nickName: "韩梅梅"),
    User(userName: "zhangsan", password: "96e79218965eb72c92a549dd5a330112", avatar: "http://pic1.zhimg.com/50/v2-ae875d1c964f122ee5ca3b182218a57a_hd.jpg",nickName: "法外狂徒张三"),
]



