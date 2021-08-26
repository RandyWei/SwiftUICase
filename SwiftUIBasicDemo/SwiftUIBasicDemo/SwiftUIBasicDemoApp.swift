//
//  SwiftUIBasicDemoApp.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/23.
//

import SwiftUI

@main
struct SwiftUIBasicDemoApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            TextFieldDemo()
        }.onChange(of: scenePhase) { (newSencePhase) in
            switch newSencePhase{
            case .active: //表示 APP 正在冶
                print("active")
            case .background: //进入后台
                print("background")
            case .inactive: //不活动
                print("inactive")
            default:
                print("default")
            }
        }
    }
}
