//
//  IntegralSummary.swift
//  App
//
//  Created by RandyWei on 2021/3/30.
//

import Foundation

struct IntegralSummary:Codable {
    var studyCycle:String  //学习周期
    var requireIntegral:Int //学年规定积分
    var userIntegral:Int //用户积分
    var todayTip:String //今日积分 tip
}
