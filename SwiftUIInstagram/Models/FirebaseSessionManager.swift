//
//  FirebaseSessionManager.swift
//  SwiftUIInstagram
//
//  Created by Saad Mansouri on 8/21/20.
//  Copyright © 2020 Saad Mansouri. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import Combine

class FirebaseSessionManager: ObservableObject {
    
    //MARK: Properties

    var didChange = PassthroughSubject<FirebaseSessionManager, Never>()
    var handle : AuthStateDidChangeListenerHandle?

    @Published var isLoggedIn: Bool?
    @Published var session : UserEntity? {
        didSet {
            self.didChange.send(self)
        }
    }
        
    //MARK: Functions
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.session = UserEntity(uid: user.uid, email: user.email)
                self.isLoggedIn = true
            } else {
                self.isLoggedIn = false
                self.session = nil
            }
        }
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func logIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            isLoggedIn = false
            session = nil
        } catch ( let error ) {
            print("Signing out faild with error ", error )
        }
    }
    
    func unbined() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbined()
    }
}
