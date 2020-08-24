//
//  DashboardView.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/19/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    @State private var selection = 0
    
    init() {
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .systemBackground
    }
    
    var body: some View {
        TabView(selection : $selection){
            HomeView().tabItem{
                VStack{
                    Image(systemName : "house")
                    Text("Home")
                }
            }.tag(0)
            SelectPictureView().tabItem{
                VStack{
                    Image(systemName : "plus.square")
                    Text("Add")
                }
            }.tag(1)
            ProfilView().tabItem{
                VStack{
                    Image(systemName : "person")
                    Text("Profil")
                }
            }.tag(2)
        }
        
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
