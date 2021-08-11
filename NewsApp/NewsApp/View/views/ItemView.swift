//
//  ItemView.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/6.
//

import SwiftUI

struct ItemView: View {
    
    var image:String
    var title:String
    var showDivider:Bool? = true
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 16,height: 16)
                    .padding(.leading)
                
                Text(title)
                    .padding(.leading,4.0)
                
                Spacer()
                
                Image(systemName: "chevron.forward")
                    .padding(.trailing)
            }
            .padding(.top,12.0)
            .padding(.bottom,3.0)
            .padding(.bottom,showDivider == true ? 0 : 5.0)
            
            if showDivider == true {
                Divider()
                    .padding(.leading,44)
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(image: "", title: "测试")
    }
}
