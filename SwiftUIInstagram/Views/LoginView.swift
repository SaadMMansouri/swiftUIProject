//
//  LoginView.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/20/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var signInIsVisible = false

    var body: some View {
        VStack{
            Spacer()
            VStack {
                Image("InstagramLogo")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(height : 200)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.top)
                
                TextField("Phone, email or username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(4)
                TextField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(4)
                
                ContainedButtonView(
                    text : "Log In",
                    color : Color.blue,
                    textColor: Color.white,
                    action: {}
                )
                TextButtonView(
                    sentence: "forgot your login details?",
                    text : "Get help signing in.",
                    action: {}
                ).frame(height : 10).padding()
                
                ZStack{
                    Divider().frame(minWidth: 0, maxWidth: .infinity)
                    Text("OR").font(.system(size: 15))
                        .padding(10)
                        .background(Color.white)
                }
                
                ContainedButtonView(
                    text : "Log in with facebook",
                    color : Color.blue,
                    textColor: Color.white,
                    action: {}
                )

            }.padding()
            Spacer()
            Divider().frame(minWidth: 0, maxWidth: .infinity)
            TextButtonView(
                sentence: "Dont have an account?",
                text : "Sign up.",
                action: {
                    self.signInIsVisible.toggle()
                }
            ).padding(.leading).padding(.trailing)
            .sheet(isPresented: $signInIsVisible, content: {SignUpView()})

        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
