//
//  TabbarView.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/28.
//

import SwiftUI

struct TabbarItem:Identifiable {
    var id = UUID()
    var index:Int
    var text:String
}

struct TabbarView:View {
    var items:[String]
    var isScrollable:Bool = false
    var showIndicator:Bool = true
    var selection: Binding<Int>?
    
    private var tabItems:[TabbarItem]{
        var index = -1
        return items.map { strItem -> TabbarItem in
            index += 1
            return TabbarItem(index: index, text: strItem)
        }
    }
    
    var body: some View{
        GeometryReader{ reader in
            if isScrollable {
                ScrollView(.horizontal,showsIndicators:false) {
                    ScrollViewReader{proxy in
                        TabbarSubview(items: tabItems,showIndicator:showIndicator,proxy:proxy,width:reader.size.width,height: reader.size.height,selection: selection)
                    }
                }
            } else {
                TabbarSubview(items: tabItems,showIndicator:showIndicator,width:reader.size.width,height: reader.size.height,selection: selection)
            }
        }
    }
    
}

struct TabbarSubview:View {
    var items:[TabbarItem]
    var showIndicator:Bool = true
    var proxy:ScrollViewProxy?
    var width:CGFloat
    var height:CGFloat
    var selection: Binding<Int>?
    
    private let indicatorHeight:CGFloat = 2
    
    private var itemWidth:CGFloat{
        if items.count > 4 {
            return width / 4
        }
        return width / CGFloat(items.count)
    }
    
    @State private var selectedIndex = 0
    
    var body: some View{
        VStack(alignment: .leading,spacing: 0) {
            HStack(spacing: 0){
                ForEach(items){item in
                    Text(item.text)
                        .frame(width:itemWidth)
                        .foregroundColor(selectedIndex == item.index ? .pink : .black)
                        .onTapGesture {
                            selectedIndex = item.index
                            selection?.wrappedValue = item.index
                            //计算剩余可滚动宽度
                            let surplusW = (CGFloat(items.count) - CGFloat(selectedIndex)) * itemWidth
                            let halfOfWidth = width / 2
                            
                            withAnimation {
                                if halfOfWidth >= surplusW {
                                    proxy?.scrollTo(item.id,anchor: .trailing)
                                } else {
                                    proxy?.scrollTo(item.id,anchor: .center)
                                }
                            }
                        }
                        .id(item.id)
                        .frame(height: height - indicatorHeight)
                }
            }
            
            if (showIndicator){
                Divider()
                    .frame(width: itemWidth,height: indicatorHeight)
                    .background(Color.pink)
                    .offset(x: CGFloat(selectedIndex) * itemWidth)
                    .animation(.easeInOut(duration: 0.2))
            }
            
        }
    }
}
