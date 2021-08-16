//
//  Overlay.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/17.
//

import SwiftUI

struct ProgressViewModifier:ViewModifier {
    
    @Binding var present:Bool //是否显示
    
    func body(content: Content) -> some View {
        
        ZStack{
            
            //使用者
            content
                .zIndex(0)
            
            //加载框内容
            VStack{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .padding(24.0)
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color.gray.opacity(0.1))
            .opacity(present ? 0 : 1)
            .zIndex(1)
        }
        
    }
}

struct ToastViewModifier:ViewModifier {
    
    @Binding var present:Bool //是否显示
    @Binding var message:String //显示的文字
    //显示在底部还是中间
    var alignment:Alignment = .center
    
    func body(content: Content) -> some View {
        ZStack{
            
            //使用者
            content
                .zIndex(0)
            
            //Toast 内容
            VStack{
                 Text(message)
                    .padding(Edge.Set.horizontal, 20)
                    .padding(Edge.Set.vertical, 10)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(5)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment:alignment)
            .background(Color.gray.opacity(0.1))
            .opacity(present ? 1 : 0)
            .zIndex(1)
            .onChange(of: present) { value in
                if (value){
                    //延迟3秒消失
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        present.toggle()
                    }
                }
            }
            
        }
    }
}

extension View {
    func loading(present: Binding<Bool>) -> some View {
        self.modifier(ProgressViewModifier(present: present))
    }
    
    func toast(present: Binding<Bool>,message:Binding<String>,alignment:Alignment = .center) -> some View {
        self.modifier(ToastViewModifier(present: present,message:message,alignment: alignment))
    }
}
