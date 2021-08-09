//
//  IntegralController.swift
//  App
//
//  Created by RandyWei on 2021/3/30.
//

import Foundation
import Vapor


//积分相关
class IntegralController {
    func summary(req: Request) -> String {
        
        let summary = IntegralSummary(studyCycle: "2021.01.01 - 2021.12.31", requireIntegral: 13500, userIntegral: 10000,todayTip:"今日已获取0.5积分,快去完成下面的任务吧")
        
        return ResponseWrapper(code: .success, data: summary).makeResponse()
    }
    
    func list(req: Request) -> String {
        return ""
    }
}
