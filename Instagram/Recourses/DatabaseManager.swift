//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Yasemin YEL on 18.04.2021.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager {
 static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    //MARK- Public
    
  ///Check if username and email
    ///- parameters
    /// - email: representing email
    /// - username : representing username
   
    
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
      completion(true)
    }
    ///insert newuser data to database
      ///- parameters
      /// - email: representing email
      /// - username : representing username
    /// - completion: Async call back for result if database entry succeeded
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        print(key)
        
         database.child(key).setValue(["username": username]) { error, _ in
            if error == nil {
                //succeeded
                completion(true)
                return
            } else {
                //failed
                completion(false)
                return
            }
        }
    }
}
