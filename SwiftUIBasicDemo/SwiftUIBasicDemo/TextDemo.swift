//
//  TextDemo.swift
//  SwiftUIBasicDemo
//
//  Created by RandyWei on 2021/3/24.
//

import SwiftUI

struct TextDemo: View {
    var body: some View {
        Text(Image(systemName: "person"))
            .font(.title)
            + Text("归属感撒个别晒噶单身狗茶杯犬ID第三空间噶啥搭噶打暑假工顺哥艾迪康老鼠过街的撒髋关节只要不是基本理都是噶倒计时不是东西撒东莞静安寺呈撒撒的感觉三第三节课尬酒但是感觉是啊哥哥哈师大噶多少十多个卡但是感觉阿斯顿山东高考哈四大皆空干活阿克苏刚看见时代光华卡说过").baselineOffset(10.0)
    }
}

struct TextDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextDemo()
    }
}
