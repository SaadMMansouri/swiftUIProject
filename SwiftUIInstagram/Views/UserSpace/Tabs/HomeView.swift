//
//  HomeView.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/19/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = PostsViewModel()
    
    @State private var scrollTarget: Int?
    @Environment(\.colorScheme) var colorScheme
    
    @State private var image: UIImage?
    @State private var showImagePicker: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        Spacer().frame(width : 10)
                        ForEach(0..<40){ index in
                            StoryCircleView().id(index)
                        }
                    }.frame(height: 100)
                }
                ScrollView{
                    VStack{
                        ForEach(viewModel.posts, id: \.id){ post in
                            PostView(
                                post_user: post.user,
                                post_description: post.description,
                                post_numberOfLikes: post.numberOfLikes,
                                post_picture: Image(post.picture),
                                post_createAt: post.createdAt
                            ).id(post.id)
                        }
                    }
                }
            }.navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading: HStack {
                    Button(action: {
                        self.showImagePicker = true
                    }) {
                        Image(systemName: "camera")
                            .font(.system(size: 25))
                    }
                    Button(action: {}) {
                        Rectangle()
                            .frame(width : 130, height : 45)
                             .foregroundColor(.clear)
                            .overlay(
                                Rectangle().mask(
                                    Image("InstagramLogo")
                                        .resizable()
                                        .scaledToFill()
                                        .padding(.top , 10)
                                )
                        )
                    }
                },
                trailing: Button(action: {}) {
                    Image(systemName: "paperplane")
                        .font(.system(size: 25))
                }
            ).onAppear{
                viewModel.fetchData()
            }.foregroundColor(
                colorScheme == .dark ? .white : .black
            )
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isPresented: self.$showImagePicker, sourceType: .photoLibrary)

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
