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
    
    @State var typeIndex:Int = 0 //类型
    
    //是否显示新闻列表
    var showNewsList:Bool{
        typeIndex == 0
    }
    
    @State var currentPage:Int = 0
    
    //分类 VM
    @StateObject private var categoryVM  = CategoryViewModel()
    //分类数据
    private var categories:[String] {
        categoryVM.categories.map { category in
            category.name
        }
    }
    
    
    var body: some View{
        VStack(spacing: 0){
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
            
            TabbarView(items: categories,isScrollable: true,selection: $tabIndex)
                .frame(height: 55)
                .background(Color.blue.opacity(0.1))
                .onChange(of: tabIndex, perform: { value in
                    print(value)
                })
                .redacted(reason: categoryVM.loaded ? [] : .placeholder)
            
            ScrollView{
                LazyVStack(spacing:0){//只支持 iOS14.0+
                    TabbarView(items: categoryVM.types,showIndicator: false,selection: $typeIndex)
                        .frame(height: 55)
                    
                    SwiperView(items: [
                        Image("newbanner1").resizable(),
                        Image("newbanner2").resizable(),
                        Image("newbanner3").resizable(),
                        Image("newbanner4").resizable()
                                ], currentPage: $currentPage)
                        .cornerRadius(12.0)
                        .padding(.horizontal)
                    
                    if showNewsList {
                        ArticleListView()
                    } else {
                        VideoListView()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct StudyPagePreviewer:PreviewProvider {
    static var previews: some View{
        StudyPage().ignoresSafeArea()
    }
}
