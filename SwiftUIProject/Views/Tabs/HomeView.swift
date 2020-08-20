//
//  HomeView.swift
//  SwiftUIProject
//
//  Created by Saad Mansouri on 8/19/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var allPosts : [PostEntity] = [
        PostEntity(
            user: "SaadManso",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            numberOfLikes: 483,
            picture: Image(systemName: "ant.circle.fill"),
            createdAt: Date()
        ),
        PostEntity(
            user: "Quisasd",
            description: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            numberOfLikes: 79,
            picture: Image(systemName: "tv.fill"),
            createdAt: Date()
        ),
        PostEntity(
            user: "Nemopogo",
            description: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
            numberOfLikes: 94,
            picture: Image(systemName: "lock.fill"),
            createdAt: Date()
        ),
        PostEntity(
            user: "Nam_libero",
            description: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            numberOfLikes: 765,
            picture: Image(systemName: "flag.slash.fill"),
            createdAt: Date()
        ),
        PostEntity(
            user: "ConseQuuntur",
            description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
            numberOfLikes: 123,
            picture: Image(systemName: "cloud.sun.fill"),
            createdAt: Date()
        ),
    ]
    
    var body: some View {
        VStack{
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    Spacer().frame(width : 10)
                    ForEach(0..<40){ _ in
                        StoryCircleView()
                    }
                }.frame(height: 100)
            }
            ScrollView{
                ForEach(allPosts, id: \.id){ post in
                    PostView(
                        post_user: post.user,
                        post_description: post.description,
                        post_numberOfLikes: post.numberOfLikes,
                        post_picture: post.picture,
                        post_createAt: post.createdAt
                    )
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
