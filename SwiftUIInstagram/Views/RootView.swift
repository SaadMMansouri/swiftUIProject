//
//  RootView.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/22/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    //MARK: Properties
    @ObservedObject var session = FirebaseSessionManager()
    
    var body: some View {
        Group {
            if session.session != nil {
                DashboardView()
            } else {
                LoginView()
            }
        }
        .onAppear(perform: getUser)
        .padding()
    }
    
    //MARK: Functions
    
    func getUser() {
        session.listen()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(FirebaseSessionManager())
    }
}
