//
//  SignUpView.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/20/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var name = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""

    
    var body: some View {
        VStack{
            Spacer()
            VStack {
                Image(systemName: "person")
                    .font(Font.system(size: 130, weight: .ultraLight))
                    .scaledToFit()
                    .frame(height : 160)
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                TextField("Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(4)
                
                TextField("Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(4)
                
                TextField("Email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(4)
                
                TextField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(4)
                
                ContainedButtonView(
                    text : "Next",
                    color : Color.blue,
                    textColor: Color.white,
                    action: {}
                )
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
