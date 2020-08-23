//
//  LoginView.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/20/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginView: View {

    @State private var signInIsVisible = false
    @State private var showsAlert = false
    
    @State private var email = ""
    @State private var password = ""
    @State private var error = ""

    @EnvironmentObject var session : FirebaseSessionManager

    func signIn() {
        session.logIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    let gradient = LinearGradient(
        gradient: Gradient(colors: [.red, .orange]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)

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
                
                TextField("Phone, email or username", text: $email)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(4)
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(4)
                
                ContainedButtonView(
                    text : "Log In",
                    color : Color.blue,
                    textColor: Color.white,
                    action: signIn
                )
                
                if error != "" {
                    Text(error)
                        .font(.system(size : 14, weight : .semibold))
                        .foregroundColor(Color.red)
                        .padding()
                }
                
                TextButtonView(
                    sentence: "forgot your login details?",
                    text : "Get help signing in.",
                    action: {}
                ).frame(height : 10).padding()
                
                ZStack{
                    Divider().frame(minWidth: 0, maxWidth: .infinity)
                    Text("OR").font(.system(size: 15))
                        .padding(10)
                        .background(Color(UIColor.systemBackground))
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
