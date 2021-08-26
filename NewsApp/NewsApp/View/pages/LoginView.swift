//
//  LoginView.swift
//  NewsApp
//
//  Created by RandyWei on 2021/8/26.
//

import SwiftUI

struct LoginView:View {
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
    
    @EnvironmentObject var userVM:UserViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View{
        ZStack{
            //顶部背景
            Image("login_bg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .offset(y: -screenHeight / 3 - 50)
                .scaleEffect(CGSize(width: 1.2, height: 1.2))
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 149/255.0, green: 117/255.0, blue: 214/255.0, opacity: 1), Color(.sRGB, red: 99/255.0, green: 117/255.0, blue: 253/255.0, opacity: 1)]), startPoint: .top, endPoint: .bottom))
                .frame(width: 100, height: 100)
                .shadow(color: .black, radius: 40, x: 0, y: 0)
                .offset(x: -screenWidth / 2 + 25,y: -screenHeight / 2 + 25)
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 149/255.0, green: 117/255.0, blue: 214/255.0, opacity: 1), Color(.sRGB, red: 99/255.0, green: 117/255.0, blue: 253/255.0, opacity: 1)]), startPoint: .top, endPoint: .bottom))
                .frame(width: 250, height: 250)
                .shadow(color: .black, radius: 20, x: 0, y: 0)
                .offset(x: screenWidth / 2 - 50,y: -screenHeight / 2 )
            
            
            GeometryReader{proxy in
                ZStack{
                    Circle()
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0.0, y: 0.0)
                    
                    VStack(alignment: .leading){
                        Text("用户名")
                            .foregroundColor(.gray)
                        
                        TextField("用户名",text:$userVM.userName)
                            .padding(.horizontal)
                            .padding(.vertical, 8.0)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5.0)
                        
                        Spacer()
                            .frame(height: 15)
                        
                        Text("密码")
                            .foregroundColor(.gray)
                        
                        SecureField("密码",text:$userVM.password)
                            .padding(.horizontal)
                            .padding(.vertical, 8.0)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5.0)
                        
                        Spacer()
                            .frame(height: 30)
                        
                        Button("立即登录"){
                            userVM.signIn{
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8.0)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width:5,height:5)))
                    }
                    .frame(width: proxy.size.width / 2, height: proxy.size.width / 2, alignment:.leading)
                    .padding()
                    .offset(x: -proxy.size.width / 6)
                }
            }
            .frame(width: screenHeight * 2 / 3.3, height: screenHeight * 2 / 3.3, alignment: .center)
            .offset(x: screenWidth / 3)
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 149/255.0, green: 117/255.0, blue: 214/255.0, opacity: 1), Color(.sRGB, red: 99/255.0, green: 117/255.0, blue: 253/255.0, opacity: 1)]), startPoint: .top, endPoint: .bottom))
                .frame(width: 60, height: 60)
                .shadow(color: .gray, radius: 40, x: 0, y: 0)
                .offset(x: -screenWidth / 2 + 150,y: screenHeight / 2 - 170)
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 149/255.0, green: 117/255.0, blue: 214/255.0, opacity: 1), Color(.sRGB, red: 99/255.0, green: 117/255.0, blue: 253/255.0, opacity: 1)]), startPoint: .top, endPoint: .bottom))
                .frame(width: 200, height: 200)
                .shadow(color: .gray, radius: 40, x: 0, y: 0)
                .offset(x: -screenWidth / 2 + 70,y: screenHeight / 2 - 90)
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 149/255.0, green: 117/255.0, blue: 214/255.0, opacity: 1), Color(.sRGB, red: 99/255.0, green: 117/255.0, blue: 253/255.0, opacity: 1)]), startPoint: .top, endPoint: .bottom))
                .frame(width: 100, height: 100)
                .shadow(color: .gray, radius: 40, x: 0, y: 0)
                .offset(x: -screenWidth / 2 + 70,y: screenHeight / 2 - 90)
            
            Button("注册"){
                
            }
            .foregroundColor(.white)
            .frame(width: 100, height: 100)
            .offset(x: -screenWidth / 2 + 70,y: screenHeight / 2 - 90)
            
            Button{
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
            }
            .foregroundColor(.white)
            .offset(x: screenWidth / 2 - 50,y: -screenHeight / 2 + (safeAreaInsets?.top ?? 0))
            
        }
        .navigationBarHidden(true)
    }
}

struct LoginViewPreviewer:PreviewProvider {
    static var previews: some View{
        LoginView()
    }
}
