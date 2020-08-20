//
//  TabbedRootView.swift
//  SwiftUIProject
//
//  Created by Saad Mansouri on 8/19/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI

struct TabbedRootView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection : $selection){
            HomeView().tabItem{
                VStack{
                    Image(systemName : "house")
                    Text("Home")
                }
            }.tag(0)
            ProfilView().tabItem{
                VStack{
                    Image(systemName : "person")
                    Text("Profil")
                }
            }.tag(1)
        }
        
    }
}

struct TabbedRootView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedRootView()
    }
}
