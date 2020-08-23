//
//  PostEntity.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/19/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct PostEntity : Identifiable , Codable {
    @DocumentID var id : String? = UUID().uuidString
    
    var user : String
    var description : String
    var numberOfLikes : Int
    var picture : String
    var createdAt : Date = Date()
    
    enum CodingKeys : String, CodingKey {
        case user
        case description
        case numberOfLikes
        case picture
    }
}
