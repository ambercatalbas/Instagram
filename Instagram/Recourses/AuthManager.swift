//
//  AuthManager.swift
//  Instagram
//
//  Created by Yasemin YEL on 18.04.2021.
//

import Foundation
import FirebaseAuth

public class AuthManager {
 static let shared = AuthManager()
    
    //MARK- Public
    
    public func registernewUser(username: String , email: String, password : String) {
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        
            if let email = email {
                // email login
                Auth.auth().signIn(withEmail: email, password: password) {authResult, Error in
                    guard authResult != nil, Error == nil  else {
                        completion(false)
                        return
                    }
                    completion(true)
                }
            }
            else if let username = username {
                //username login
                print(username)
            }
            
    }
    
}
