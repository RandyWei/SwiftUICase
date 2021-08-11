//
//  OverView.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/3.
//

import SwiftUI

struct OverView:View {
    
    let screen = UIScreen.main.bounds
    let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
    let padding:CGFloat = 8.0
    
    private var circleHeight:CGFloat{
        screen.width / 2 - padding * 2 - (screen.width / 2 - padding * 2) / 4
    }
    
    private var circleOffsetY:CGFloat{
        (screen.width / 2 - padding * 2) / 4 / 2
    }
    
    var body: some View{
        VStack{
            Text("学习任务")
                .frame(height: 45)
                .font(Font.system(size: 18))
            
            Text("学习周期:2021.01.01 - 2021.12.31")
                .font(Font.system(size: 12))
            
            ZStack(alignment: .center) {
                Circle()
                    .trim(from: 0.4, to: 1.0)
                    .stroke(style: StrokeStyle(lineWidth:10,lineCap: .round))
                    .rotation(.degrees(18.5))
                    .frame(width: screen.width / 2 - padding * 2, height: screen.width / 2 - padding * 2)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .offset(y:circleOffsetY)
                
                Circle()
                    .trim(from: 0.4, to: 0.6)
                    .stroke(style: StrokeStyle(lineWidth:10,lineCap: .round))
                    .rotation(.degrees(18.5))
                    .frame(width: screen.width / 2 - padding * 2, height: screen.width / 2 - padding * 2)
                    .offset(y:circleOffsetY)
                 
                VStack {
                    Text("10000分")
                        .font(Font.system(size: 36))
                    Text("学年积分")
                        .font(Font.system(size: 12))
                        .padding(.top,4.0)
                }
            }
            .padding(.top,padding)
            .frame(height:circleHeight)
            
            HStack(){
                Spacer()
                VStack(){
                    Text("13500分")
                        .font(Font.system(size: 16))
                    Text("学年规定积分")
                        .font(Font.system(size:12))
                }
                Spacer()
                VStack(){
                    Text("3500分")
                        .font(Font.system(size: 16))
                    Text("还差")
                        .font(Font.system(size:12))
                }
                
                Spacer()
            }
            
        }
        .padding(.top,safeAreaInsets?.top ?? 0 )
        .foregroundColor(.white)
    }
}
