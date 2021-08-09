//
//  VideoController.swift
//  App
//
//  Created by RandyWei on 2021/3/29.
//

import Foundation
import Vapor
import Kanna

class VideoController {
    func list(req:Request) -> EventLoopFuture<String> {
        let urlString = "https://www.eyuyan.tv/?mod=type&ac=getalbum&topid=1&parentid=0&typeid=0&sort=0&r=0&s=0&d=0&level=&w=&st=0&album=1"
        
        return req.client.get(URI(string: urlString)).map { res in
            
            var result:[Video4App]
            
            if res.status == .ok {
                guard let body = res.body else {
                    return ResponseWrapper<DefaultResponseObj>(code: .failedParamError,msg: "网络请求出错").makeResponse()
                }
                
                let data = Data(buffer: body)
                
                guard let netData = try? JSONDecoder().decode(VideoJsonWrapper.self, from: data) else { return ResponseWrapper<DefaultResponseObj>(code: .failedParamError,msg: "网络请求出错").makeResponse() }
                
                result = netData.data.map { item -> Video4App in
                    Video4App(title: item.name, imgUrl: "https://www.eyuyan.tv/\(item.cover)", duration: "02:32", id: item.typeid,video: "",desc: "")
                }
            } else {
                return ResponseWrapper<DefaultResponseObj>(code: .failedParamError,msg: "网络请求出错").makeResponse()
            }
            
            return ResponseWrapper(code: .success , data: result).makeResponse()
        }
    }
    
    func info(req: Request) -> String {
        guard let id = req.query["id"] as String? else { return ResponseWrapper<DefaultResponseObj>(code: .failedParamError).makeResponse() }
        
        let urlString = "https://www.eyuyan.tv/l\(id).html"
        
        guard let url = URL(string: urlString),let doc = try? HTML(url:url, encoding: .utf8) else {
            return ResponseWrapper<DefaultResponseObj>(code: .failedParamError,msg: "网络请求出错").makeResponse()
        }
        let htmlText = doc.body?.text ?? ""
        let startRange = htmlText.range(of: #"video:""#)?.upperBound ?? htmlText.startIndex
        let endRange = htmlText.range(of: #".mp4"#)?.lowerBound ?? htmlText.startIndex
        let videoUrl = htmlText[startRange...endRange]
        
        let video = "\(videoUrl)mp4"
        let divObj = doc.xpath("//div[@class='courseinfo']")
        var desc = ""
        if divObj.count > 0 {
            desc = divObj[0].toHTML ?? ""
        }
        let video4App = Video4App(title: "", imgUrl: "", duration: "", id: "",video: video,desc: desc)
        return ResponseWrapper(code: .success, data: video4App).makeResponse()
    }
}
