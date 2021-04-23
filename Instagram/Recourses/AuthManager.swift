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
    
    public func registernewUser(username: String , email: String, password : String, completion:@escaping (Bool) -> Void) {
        
        /* - check if username available
         - check if email available
    */
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                /*
                 - create account
                 - Insert account to database
                 */
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        //Firebase auth could not reate account
                        completion(false)
                        return
                    }
                  //  insert into Database
                    
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            //failed to insert to database
                            completion(false)
                            return
                        }
                        
                    }
                }
            }
            else {
                //either username or email does not exist
                completion(false)
            }
        }
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        
            if let email = email {
                // email login
                
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    guard authResult != nil, error == nil  else {
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
    /// Attempt to log out  firebase user
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print(error)
            completion(false)
            return
        }
        
    }
    
}
