//
//  NativeDemo2.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/4/17.
//

import SwiftUI

struct NativeDemo2: View {
    var swiperData = [10,50,200,90,100,233,70,79,89,99]
    @State var selection:Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Swiper(with: swiperData.map { SwiperItem(data: $0) }, selection: $selection )
                .aspectRatio(16/9 ,contentMode: .fit)
            SwiperControl(numberOfPages: swiperData.count, currentPage: $selection)
        }
    }
}

struct SwiperItem:View {
    
    var data: Int
    
    var body: some View{
        Color(red: Double(255 - data) / 255.0, green: Double(255 - data) / 255.0, blue: Double(data) / 255.0)
//          Text("text\(data)")
    }
}

struct NativeDemo2_Previews: PreviewProvider {
    static var previews: some View {
        NativeDemo2()
    }
}
