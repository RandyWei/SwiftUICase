//
//  TaskPage.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/27.
//

import SwiftUI

struct TaskPage:View {
    var body: some View{
        ZStack(alignment:.top){
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 20/255.0, green: 158/255.0, blue: 231/255.0, opacity: 1), Color(.sRGB, red: 255/255.0, green: 255/255.0, blue: 255/255.0, opacity: 1)]), startPoint: .top, endPoint: .bottom)
            
            OverView()
        }
    }
}

struct TaskPagePreviewer:PreviewProvider {
    static var previews: some View{
        TaskPage().ignoresSafeArea()
    }
}
