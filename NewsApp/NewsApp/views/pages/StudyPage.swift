//
//  StudyPage.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/27.
//

import SwiftUI
struct StudyPage:View {
    
    let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
    private let padding:CGFloat = 8.0
    @State var tabIndex:Int = 0
    
    var body: some View{
        VStack(){
            //标题栏
            AppBarView {
                Image("tool_bar_left_icon")
                    .resizable()
                    .frame(width: 69,height: 25)
                
                //搜索框
                HStack{
                    Image(systemName: "magnifyingglass")
                    Text("搜索感兴趣的内容")
                    Spacer()
                }
                .padding(.horizontal,12.0)
                .padding(.vertical,8.0)
                .background(Color.white.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                
                HStack{
                    Text("学习\n进度")
                    Text("100%")
                }
                .foregroundColor(.white)
                
                
                Image(systemName: "bell")
            }
            
            TabbarView(items: ["思想政治","法律法规","职业道德","诚信自律"],isScrollable: true,selection: $tabIndex)
                .frame(height: 55)
                .background(Color.blue.opacity(0.1))
                .onChange(of: tabIndex, perform: { value in
                    print(value)
                })
            
            TabbarView(items: ["相关资讯","视频课程"],showIndicator: false)
                .frame(height: 55)
                .onChange(of: tabIndex, perform: { value in
                    print(value)
                })
            
            Spacer()
        }
    }
}

struct StudyPagePreviewer:PreviewProvider {
    static var previews: some View{
        StudyPage()
    }
}
