//
//  BottomSheet.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/16.
//

import SwiftUI

struct BottomSheetViewModifier<ViewContent:View>:ViewModifier {
    
    let title:Text?
    let messageContent: ViewContent
    @Binding var isPresent:Bool
    
    init(isPresent:Binding<Bool>,title:Text?, @ViewBuilder content:() -> ViewContent) {
        self.title = title
        self.messageContent = content()
        self._isPresent = isPresent
    }
    
    func body(content: Content) -> some View {
        ZStack{
            
            content
            
            ZStack{
                VStack(){
                    
                    if title != nil {
                        title
                            .padding(.top, 16)
                        Divider()
                    }
                    
                    messageContent
                    
                }
                .offset(y: isPresent ? 0 : 130)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .onTapGesture {
                    
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
            .background(Color.gray.opacity(0.1))
            .opacity(isPresent ? 1 : 0)
            .animation(.easeInOut(duration: 0.1))
            .onTapGesture {
                isPresent.toggle()
            }
            
        }
    }
}

extension View{
    func bottomSheet<Content>(isPresent:Binding<Bool>,title:Text?, @ViewBuilder content:() -> Content) -> some View where Content : View {
        self.modifier(BottomSheetViewModifier(isPresent: isPresent, title: title, content: content))
    }
}
