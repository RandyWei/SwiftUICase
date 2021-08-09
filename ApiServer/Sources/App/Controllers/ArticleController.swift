//
//  ArticleController.swift
//  App
//
//  Created by RandyWei on 2021/3/29.
//

import Foundation
import Vapor
import Kanna

class ArticleController {
    func list(req: Request) -> EventLoopFuture<String> {
        guard let offset = req.query["offset"] as Int? else {
            return ResponseWrapper<DefaultResponseObj>(code: .failedParamError).makeFutureResponse(req: req)
        }
        
        let urlString = "https://i.news.qq.com/trpc.qqnews_web.kv_srv.kv_srv_http_proxy/list?sub_srv_id=24hours&srv_id=pc&offset=\(offset)&limit=20&strategy=1&ext=%7B%22pool%22:%5B%22top%22%5D,%22is_filter%22:7,%22check_type%22:true%7D"
        
        return req.client.get(URI(string: urlString)).map { res in
            
            var result:[News]
            
            if res.status == .ok {
                guard let body = res.body else {
                    return ResponseWrapper<DefaultResponseObj>(code: .failedParamError,msg: "网络请求出错").makeResponse()
                }
                
                let data = Data(buffer: body)
                
                guard let netData = try? JSONDecoder().decode(TencentNewsRootNode.self, from: data) else { return ResponseWrapper<DefaultResponseObj>(code: .failedParamError,msg: "网络请求出错").makeResponse() }
                
                if netData.ret == 0 {
                    result = netData.data.list.map { tn -> News in
                        News(id: tn.cms_id, title: tn.title, mediaName: tn.media_name, publishTime: tn.publish_time, content: "")
                    }
                } else {
                    return ResponseWrapper<DefaultResponseObj>(code: .failedParamError,msg: "网络请求出错").makeResponse()
                }
            } else {
                return ResponseWrapper<DefaultResponseObj>(code: .failedParamError,msg: "网络请求出错").makeResponse()
            }
            
            return ResponseWrapper(code: .success , data: result).makeResponse()
        }
    }
    
    func info(req: Request) -> String {
        guard let newsId = req.query["id"] as String? else { return ResponseWrapper<DefaultResponseObj>(code: .failedParamError).makeResponse() }
        
        let urlString = "https://new.qq.com/rain/a/\(newsId)"
        
        guard let url = URL(string: urlString),let doc = try? HTML(url:url, encoding: .utf8) else {
            return ResponseWrapper<DefaultResponseObj>(code: .failedParamError,msg: "网络请求出错").makeResponse()
        }
        
        let divObj = doc.xpath("//div[@class='content-article']")
        
        if divObj.count > 0 {
            let news = News(id: newsId,title: "",mediaName: "",publishTime: "", content: divObj[0].toHTML ?? "")
            return ResponseWrapper(code: .success, data: news).makeResponse()
        }
        
        return ResponseWrapper<DefaultResponseObj>(code: .failedParamError,msg: "网络请求出错").makeResponse()
    }
}
