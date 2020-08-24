//
//  PostsViewModel.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/23/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreSwift

class PostsViewModel : ObservableObject {
    
    @Published var posts = [PostEntity]()
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("posts").addSnapshotListener { querySnapshot, error in
            
            guard let documents = querySnapshot?.documents else {
                print("no data fetched")
                return
            }
            
            self.posts = documents.compactMap { (queryDocumentSnapshot) -> PostEntity? in
                return try? queryDocumentSnapshot.data(as : PostEntity.self)
            }
        }
    }
    
}
