//
//  ArticleListView.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/29.
//

import SwiftUI

struct ArticleListView:View {
    
    var articles:[Article]
    
    var body: some View{
        ForEach(articles) { article in
            Text(article.title)
                .font(Font.system(size: 16))
                .foregroundColor(Color(.sRGB, red: 51/255, green: 51/255, blue: 51/255, opacity: 1))
            HStack{
                Text(article.mediaName)
                    .font(Font.system(size: 10))
                Spacer()
                Text(article.publishTime)
                    .font(Font.system(size: 10))
            }
            .foregroundColor(Color(.sRGB, red: 153/255, green: 153/255, blue: 153/255, opacity: 1))
        }
        .padding(.top)
        .padding(.horizontal)
    }
}
