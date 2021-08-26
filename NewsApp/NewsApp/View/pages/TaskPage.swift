//
//  TaskPage.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/27.
//

import SwiftUI

struct TaskPage:View {
    
    @State var overViewSize:CGSize = .zero
    let padding:CGFloat = 8.0
    @State var dates:[String] = []
    
    var body: some View{
        ZStack(alignment:.top){
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 1), Color(.sRGB, red: 255/255.0, green: 255/255.0, blue: 255/255.0, opacity: 1)]), startPoint: .top, endPoint: .bottom)
            
            OverView()
                .measureSize { size in
                    overViewSize = size
                }
            
            VStack{
                ScrollView(.vertical,showsIndicators: false){
                    LazyVStack(spacing: 0){
                        
                        Color.clear.frame(height: overViewSize.height + padding * 2)
                        
                        HStack(){
                            Text("学习明细")
                                .font(Font.system(size: 16))
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding()
                        .background(RoundedCorners(top: 15.0,background: Color.white))
                        
                        HStack{
                            Text("最近一周获得积分情况")
                                .font(Font.system(size: 14))
                                .foregroundColor(Color(.sRGB,red: 151/255.0,green: 151/255.0,blue: 151/255.0))
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .background(Color.white)
                        
                        
                        HStack{
                            ChartView()
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .background(Color.white)
                        
                        //日期
                        HStack(spacing: 0){
                            ForEach(dates, id: \.self) {
                                Text($0)
                                    .frame(width: (UIScreen.main.bounds.width - 30) / 7)
                                    .foregroundColor(Color(.sRGB, red: 151/255.0, green: 151/255.0, blue: 151/255.0, opacity: 1))
                                    .font(Font.system(size:12))
                            }
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .background(Color.white)
                        .onAppear {
                            dates = getWeekDate()
                        }
                        
                        HStack{
                            Text("今日获得0积分,快去完成下面的任务吧")
                                .foregroundColor(Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 1))
                                .font(Font.system(size: 14))
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding()
                                .background(Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 0.1))
                                .cornerRadius(5)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        
                        
                        DailyTask()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                        
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func getWeekDate() -> [String] {
        
        var dates:[String] = []
        dates.append("今日")
        
        for index in 1...6 {
            //距离今天的时间
            let sinceTime = index * -24 * 60 * 60
            let date = Date(timeIntervalSinceNow: Double(sinceTime))
            let calendar = Calendar.current
            let comp = calendar.dateComponents([.month,.day], from: date)
            guard let day = comp.day,let month = comp.month else {
                return []
            }
            
            var monthStr = "\(month)"
            if month < 10 {
                monthStr = "0\(month)"
            }
            
            var dayStr = "\(day)"
            if day < 10 {
                dayStr = "0\(day)"
            }
            
            dates.append("\(monthStr):\(dayStr)")
        }
        
        return dates.reversed()
    }
}

struct TaskPagePreviewer:PreviewProvider {
    static var previews: some View{
        Group {
            TaskPage().ignoresSafeArea()
        }
    }
}
