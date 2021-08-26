//
//  UserViewModel.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/25.
//

import Foundation


let LoggedKey = "LoggedKey"

class UserViewModel: ObservableObject {
    
    //是否已经登录或者不用 bool 类型的话，可以让用户对象，如果为空表示未登录
    @Published private(set) var isLogged:Bool = UserDefaults.standard.bool(forKey: LoggedKey){
        didSet{
            UserDefaults.standard.set(self.isLogged,forKey: LoggedKey)
        }
    }
    
    //用户名
    @Published var userName:String = ""
    
    
    //密码
    @Published var password:String = ""
    
    func signIn(completion: ()->()) {
        //走登录逻辑，如果成功的话，就调用以下代码；如果不成功的话，应该 toast 提示
        isLogged = true
        completion()
    }
    
    
}
