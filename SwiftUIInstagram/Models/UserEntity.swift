//
//  UserEntity.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/21/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import Foundation
import SwiftUI

struct UserEntity : Identifiable {
    var id = UUID()
    
    var uid : String
    var email : String?
    var username : String?
    var password : String?
    var picture : Image?
    
}
