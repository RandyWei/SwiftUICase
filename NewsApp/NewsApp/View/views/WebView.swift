//
//  WebView.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/13.
//

import Foundation
import UIKit
import WebKit
import SwiftUI

struct WebView:UIViewRepresentable {
    
    var htmlString:String
    var baseUrl:URL?
    var store:WebViewStore
    
    func makeUIView(context: Context) -> WKWebView {
        store.coordinator = context.coordinator
        let webView = WKWebView()
        context.coordinator.wkWebView = webView
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: baseUrl)
    }
    
    typealias UIViewType = WKWebView
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator()
    }
    
}

class WebViewCoordinator: NSObject{
    
    var wkWebView:WKWebView?
    
    func zoom(zoom: Double) {
        let jsString =
            """
            document.querySelector(".articleContainer").style.zoom = \(zoom)
            """
        wkWebView?.evaluateJavaScript(jsString, completionHandler: nil)
    }
}

class WebViewStore: ObservableObject {
    var coordinator: WebViewCoordinator?
}
