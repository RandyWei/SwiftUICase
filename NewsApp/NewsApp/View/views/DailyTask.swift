//
//  DailyTask.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/6.
//

import SwiftUI

struct DailyTask: View {
    var body: some View {
        VStack {
            
            HStack{
                
                VStack( alignment:.leading){
                    Text("登录")
                        .font(Font.system(size: 16))
                    Text("5积分/每日首次登录")
                        .font(Font.system(size: 14))
                    HStack{
                        ProgressView(value: 1)
                            .frame(width: UIScreen.main.bounds.width / 3)
                            .accentColor(Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 1))
                        Text("已获得5积分/每日上限5积分")
                            .font(Font.system(size: 10))
                    }
                }
                
                Spacer()
                
                Button("已完成"){
                    
                }
                .font(Font.system(size: 14))
                .padding(.horizontal)
                .padding(.vertical, 5.0)
                .foregroundColor(Color(.sRGB, red: 204/255.0, green: 204/255.0, blue: 204/255.0, opacity: 1))
                .background(Color(.sRGB, red: 238/255.0, green: 238/255.0, blue: 238/255.0, opacity: 1))
                .clipShape(Capsule())
                .disabled(true)
                
            }
            
            Divider()
            
            HStack{
                
                VStack(alignment: .leading){
                    Text("文章学习")
                        .font(Font.system(size: 16))
                    
                    Text("10积分/每有效阅读1篇文章")
                        .font(Font.system(size: 14)) + Text(Image("question_mark"))
                    
                    HStack{
                        ProgressView(value: 0.5)
                            .frame(width: UIScreen.main.bounds.width / 3)
                            .accentColor(Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 1))
                        Text("已获得50积分/每日上限100积分")
                            .font(Font.system(size: 10))
                    }
                }
                
                Spacer()
                
                Button("去学习"){
                    
                }
                .font(Font.system(size: 14))
                .padding(.horizontal)
                .padding(.vertical, 5.0)
                .foregroundColor(Color(.sRGB, red: 255/255.0, green: 89/255.0, blue: 0/255.0, opacity: 1))
                .overlay(
                    Capsule()
                        .stroke()
                        .foregroundColor(Color(.sRGB, red: 255/255.0, green: 89/255.0, blue: 0/255.0, opacity: 1))
                )
                
            }
            
            Divider()
            
            HStack{
                
                VStack(alignment: .leading){
                    Text("视听学习")
                        .font(Font.system(size: 16))
                    
                    Text("10积分/每有效观看视频累计1分钟")
                        .font(Font.system(size: 14)) + Text(Image("question_mark"))
                    
                    HStack{
                        ProgressView(value: 0.5)
                            .frame(width: UIScreen.main.bounds.width / 3)
                            .accentColor(Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 1))
                        Text("已获得50积分/每日上限100积分")
                            .font(Font.system(size: 10))
                    }
                }
                
                Spacer()
                
                Button("去学习"){
                    
                }
                .font(Font.system(size: 14))
                .padding(.horizontal)
                .padding(.vertical, 5.0)
                .foregroundColor(Color(.sRGB, red: 255/255.0, green: 89/255.0, blue: 0/255.0, opacity: 1))
                .overlay(
                    Capsule()
                        .stroke()
                        .foregroundColor(Color(.sRGB, red: 255/255.0, green: 89/255.0, blue: 0/255.0, opacity: 1))
                )
                
            }
            
        }
    }
}

struct DailyTask_Previews: PreviewProvider {
    static var previews: some View {
        DailyTask()
    }
}
