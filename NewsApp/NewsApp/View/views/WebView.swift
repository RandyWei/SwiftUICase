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
    var store:WebViewStore?
    var scrollHeight:Binding<CGFloat>?
    
    func makeUIView(context: Context) -> WKWebView {
        store?.coordinator = context.coordinator
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        context.coordinator.wkWebView = webView
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: baseUrl)
    }
    
    typealias UIViewType = WKWebView
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(self)
    }
    
}

class WebViewCoordinator: NSObject, WKNavigationDelegate{
    
    var wkWebView:WKWebView?
    var parent:WebView
    init(_ parent:WebView) {
        self.parent = parent
    }
    
    func zoom(zoom: Double) {
        let jsString =
            """
            document.querySelector(".articleContainer").style.zoom = \(zoom)
            """
        wkWebView?.evaluateJavaScript(jsString, completionHandler: nil)
    }
    
    private func getScrollHeight() {
        let jsString =
            """
            document.querySelector(".videoContainer").clientHeight
            """
        wkWebView?.evaluateJavaScript(jsString, completionHandler: { result, error in
            guard let height = result else {
                return
            }
            self.disableScroll()
            self.parent.scrollHeight?.wrappedValue = height as? CGFloat ?? 0
        })
    }
    
    func disableScroll() {
        wkWebView?.scrollView.isScrollEnabled = false
        wkWebView?.scrollView.panGestureRecognizer.isEnabled = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        getScrollHeight()
    }
    
}

class WebViewStore: ObservableObject {
    var coordinator: WebViewCoordinator?
}
