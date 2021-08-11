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
    @State var showNewsList:Bool = true
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
                    TabbarView(items: ["相关资讯","视频课程"],showIndicator: false,selection: $typeIndex)
                        .frame(height: 55)
                        .onChange(of: typeIndex, perform: { value in
                            showNewsList = value == 0
                        })
                    
                    SwiperView(items: [
                                Image("banner1").resizable(),Image("banner2").resizable(),Image("banner3").resizable(),Image("banner4").resizable()], currentPage: $currentPage).aspectRatio(7/3,contentMode: .fit)
                        .cornerRadius(12.0)
                        .padding(.horizontal)
                    
                    if showNewsList {
                        ArticleListView(articles: [Article(id: "0", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了", mediaName: "来源：“学习强国”学习平台", publishTime: "2020-02-8", content: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了"),
                                                   Article(id: "1", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了", mediaName: "来源：“学习强国”学习平台", publishTime: "2020-02-8", content: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了"),
                                                   Article(id: "2", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了", mediaName: "来源：“学习强国”学习平台", publishTime: "2020-02-8", content: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了"),Article(id: "3", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了", mediaName: "来源：“学习强国”学习平台", publishTime: "2020-02-8", content: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了")])
                    } else {
                        VideoListView(videos: [
                            VideoModel(id: "0", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了", duration: "时长:10:00:00", imgUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F1114%2F0H120155P2%2F200H1155P2-8-1200.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1630193498&t=2e40f270dfdbef162a2556acfc4143c9"),
                           VideoModel(id: "1", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了", duration: "时长:10:00:00", imgUrl: ""),
                           VideoModel(id: "2", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了", duration: "时长:10:00:00", imgUrl: ""),
                           VideoModel(id: "3", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了", duration: "时长:10:00:00", imgUrl: ""),
                            VideoModel(id: "5", title: "人社部向疫情防控期参与复工复产的劳动者表达敬佩：您辛苦了", duration: "时长:10:00:00", imgUrl: "")])
                    }
                    
                }
            }
        }
    }
}

struct StudyPagePreviewer:PreviewProvider {
    static var previews: some View{
        StudyPage().ignoresSafeArea()
    }
}
