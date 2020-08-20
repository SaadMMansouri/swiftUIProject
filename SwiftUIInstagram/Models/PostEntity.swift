//
//  PostEntity.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/19/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import Foundation
import SwiftUI

struct PostEntity : Identifiable {
    var id = UUID()
    
    var user : String
    var description : String
    var numberOfLikes : Int
    var picture : Image
    var createdAt : Date
    
}
