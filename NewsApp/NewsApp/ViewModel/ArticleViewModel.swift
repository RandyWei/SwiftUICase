//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/12.
//

import SwiftUI

let htmlHeader =
                        """
                            <html>
                                <head>
                                <meta charset="utf-8">
                                <meta name="viewport" content="width=device-width,initial-scale=1.0">
                                <style>
                                    img{
                                       max-width: 100% !important;
                                    }
                                </style>
                                </head>
                                <body>
                        """

let htmlFooter =
                        """
                            </body>
                            </html>
                        """

class ArticleViewModel: ObservableObject {
    
    private let service = ArticleService()
    
    //新闻列表数据
    @Published private(set) var articles:[Article] = Array(generating: { index in
        return .mock(id: "\(index)", title: String(repeating: "新闻标题", count: Int.random(in: 5...15)))
    }, count: 10)
    
    @Published private(set) var listLoaded:Bool = false
    
    //新闻详情信息
    @Published private(set) var articleContent:String = ""
    
    //新闻详情是否加载
    @Published var loaded = false
    
    //详情加载失败文字
    @Published var message = ""
    
    //是否显示 toast
    @Published var showToast = false
    
    //WebView 操作器
    private(set) var webViewStore = WebViewStore()
    
    private var offset = 1
    

    //字体大小存储配置
    @AppStorage("ArticleFontSizeSetting") var articleFontSizeSetting:Double = 1.0
    
    init() {
        self.list()
    }
    
    private func list(){
        service.list(offset: offset) { (list:[Article]?, msg, code) in
            guard let data = list else {
                return
            }
            self.articles = data
            self.listLoaded = true
        }
    }
    
    func info(id:String) {
        service.info(id: id) { (data:Article?, msg, code) in
            self.loaded = true
            guard let article = data else {
                self.message = "数据加载失败"
                self.showToast = true
                return
            }
            //MARK: WebView 渲染 html，时间比较慢，在这个时间段的时候 loading 已经消失，导致产生一段时间的空白，尝试是否能解决这一段时间的空白
            self.articleContent =
                """
                \(htmlHeader)
                <div class="articleContainer" style="zoom:\(self.articleFontSizeSetting)">\(article.content)</div>
                \(htmlFooter)
                """
        }
    }
    
    func zoom(_ value: Double) {
        //0.75 1 1.25 1.5 1.75
        webViewStore.coordinator?.zoom(zoom: value / 100)
        articleFontSizeSetting = value / 100
    }
    
}
