//
//  SignUpView.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/20/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    
    @State private var name = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var error = ""

    @EnvironmentObject var session : FirebaseSessionManager

    func signUp() {
        if !email.isEmpty && !password.isEmpty {
            session.signUp(email: email, password: password) { (result, error) in
                if let error = error {
                    self.error = error.localizedDescription
                } else {
                    self.email = ""
                    self.password = ""
                }
            }
        }
    }
    
    var body: some View {
        VStack{
            Spacer()
            VStack {
                Image(systemName: "person")
                    .font(Font.system(size: 130, weight: .ultraLight))
                    .scaledToFit()
                    .frame(height : 160)
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                TextField("Email", text: $email)
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
                    text : "Next",
                    color : Color.blue,
                    textColor: Color.white,
                    action: signUp
                )
                
                if error != "" {
                    Text(error)
                        .font(.system(size : 14, weight : .semibold))
                        .foregroundColor(Color.red)
                        .padding()
                }
                
            }.padding()
            Spacer()
            Divider().frame(minWidth: 0, maxWidth: .infinity)
            TextButtonView(
                sentence: "Already have an account?",
                text : "Log in.",
                action: {}
            ).padding(.leading).padding(.trailing)
            

        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
