//
//  ContentView.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            StudyPage()
                .tabItem {
                    Image("study_icon")
                    Text("学习")
                }
                .ignoresSafeArea( edges: .top)
            TaskPage()
                .tabItem {
                Image("task_icon")
                Text("任务")
            }
            ProfilePage()
                .tabItem {
                Image("mine_icon")
                Text("我的")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
