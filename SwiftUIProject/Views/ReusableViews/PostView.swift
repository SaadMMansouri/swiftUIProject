//
//  PostView.swift
//  SwiftUIProject
//
//  Created by Saad Mansouri on 8/19/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI

struct PostView: View {
    
    var post_user : String
    var post_description : String
    var post_numberOfLikes : Int
    var post_picture : Image
    var post_createAt : Date

    var body: some View {
        VStack{
            VStack{
                HStack{
                    Image(systemName: "largecircle.fill.circle")
                        .frame(width : 40, height: 40)
                        .background(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                        .foregroundColor(Color.black.opacity(0.3))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black.opacity(0.3), lineWidth: 2))
                    Text(post_user).fontWeight(.bold)
                    Spacer()
                    Image(systemName: "ellipsis").rotationEffect(.init(degrees: 90))
                }
            }.padding()
            post_picture
                .frame(height : 300)
                .frame(minWidth : 0, maxWidth: .infinity).background(Color.init(red: 0.95, green: 0.95, blue: 0.95))
            VStack{
                HStack{
                    Image(systemName: "heart")
                    Image(systemName: "bubble.right")
                    Spacer()
                    Image(systemName: "bookmark")
                }
                HStack{
                    Text("\(post_numberOfLikes) likes").fontWeight(.medium)
                    Spacer()
                }
                HStack{
                    Text(post_user).fontWeight(.medium) + Text(" " + post_description)
                    Spacer()
                }
                HStack{
                    Text("posted 30 min ago")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Spacer()
                }
                
            }.padding()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(
            post_user: "UnknowUser",
            post_description: "No description",
            post_numberOfLikes: 0,
            post_picture: Image(systemName: "camera.viewfinder"),
            post_createAt: Date()
        )
    }
}
