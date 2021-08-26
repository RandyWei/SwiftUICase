//
//  ProfilePage.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/27.
//

import SwiftUI

struct ProfilePage:View {
    var body: some View{
        VStack {
            AppBarView {
                Text("我的")
                    .frame(maxWidth:.infinity)
            }
            
            
            ScrollView{
                LazyVStack{
                    
                    HStack{
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 80,height: 80)
                            .background(Color.white)
                            .clipShape(Circle())
                        
                        VStack{
                            Text("182****0000")
                                .font(Font.system(size: 18))
                                .foregroundColor(Color(.sRGB, red: 51/255.0, green: 51/255.0, blue: 51/255.0, opacity: 1))
                            
                            Spacer()
                            
                            Text("已坚持学习22天")
                                .font(Font.system(size: 12))
                                .foregroundColor(Color(.sRGB, red: 153/255.0, green: 153/255.0, blue: 153/255.0, opacity: 1))
                        }
                        .padding(.vertical)
                        
                        Spacer()
                    }
                    .padding()
                    
                    ItemView(image: "my_point", title: "学习积分")
                    ItemView(image: "browse_record", title: "浏览记录")
                    ItemView(image: "learn_archives", title: "学习档案",showDivider: false)
                    
                    Color.gray.opacity(0.1)
                    
                    ItemView(image: "common_problem", title: "常见问题")
                    ItemView(image: "version_information", title: "版本信息")
                    ItemView(image: "setting", title: "个人设置")
                    ItemView(image: "online_service_icon", title: "联系我们")
                    
                }
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfilePagePreviewer:PreviewProvider {
    static var previews: some View{
        ProfilePage()
            .ignoresSafeArea(edges: .top)
    }
}
