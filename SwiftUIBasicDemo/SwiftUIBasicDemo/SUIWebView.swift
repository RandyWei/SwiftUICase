//
//  SUIWebView.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/17.
//

import SwiftUI
import WebKit

struct SUIWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webview = WKWebView()
        webview.navigationDelegate = context.coordinator
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: "https://www.baidu.com")!))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    typealias UIViewType = WKWebView
    
}

class Coordinator: NSObject,WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.title") { (result, error) in
            print("didFinish:\(result)")
        }
    }
}
