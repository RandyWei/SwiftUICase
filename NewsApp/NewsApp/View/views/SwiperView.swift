//
//  SwiperView.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/29.
//

import SwiftUI

struct SwiperView<SwiperItem:View>:View {
    
    var items:[SwiperItem]
    @Binding var currentPage:Int
    
    private let timer = Timer.publish(every: 3, on: .current, in: .common).autoconnect()
    
    var body: some View{
        ZStack(alignment:.bottom) {
            Swiper(items: items, currentPage: $currentPage)
            SwiperControl(numOfPages: items.count, currentPage: $currentPage)
        }
        .aspectRatio(7/3,contentMode: .fit)
        .onReceive(timer, perform: { _ in
            currentPage += 1
            if currentPage >= items.count{
                currentPage = 0
            }
        })
    }
}

