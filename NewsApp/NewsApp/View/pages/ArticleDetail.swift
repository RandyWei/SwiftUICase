//
//  ArticleDetail.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/13.
//

import SwiftUI

struct ArticleDetail: View {
    
    @StateObject private var articleVM = ArticleViewModel()
    var id:String
    @State var present:Bool = false
    @State var fontValue = 100.0
    
    var body: some View {
        WebView(htmlString: articleVM.articleContent, baseUrl: URL(string: "https://new.qq.com/")!,store: articleVM.webViewStore)
            .navigationTitle("资讯详情")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                Image(systemName: "textformat.size")
                    .onTapGesture {
                        present.toggle()
                    }
            })
            .bottomSheet(isPresent: $present, title: Text("字体大小").bold(), content: {
                VStack{
                    HStack{
                        Text("较小")
                        Spacer()
                        Text("标准")
                        
                        Spacer()
                        Text("普大")
                        
                        Spacer()
                        Text("超大")
                        
                        Spacer()
                        Text("特大")
                    }
                    
                    Slider(value: $fontValue,in: 75...175, step: 25)
                        .onChange(of: fontValue) { value in
                            articleVM.zoom(value)
                        }
                    
                }
                .font(Font.system(size: 14))
                .padding()
                .padding(.horizontal, 12.0)
            })
            .loading(present: $articleVM.loaded)
            .toast(present: $articleVM.showToast, message: $articleVM.message)
            .onAppear{
                articleVM.info(id: self.id)
                fontValue = articleVM.articleFontSizeSetting * 100.0
            }
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetail(id: "0")
    }
}
