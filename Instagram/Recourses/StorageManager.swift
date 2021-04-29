//
//  StorageManager.swift
//  Instagram
//
//  Created by Yasemin YEL on 18.04.2021.
//

import Foundation
import FirebaseStorage

public class StorageManager {
    
 static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
   public enum IGStorageManagerError: Error {
        case failedToDownload
    }
    
    //MARK- Public
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result <URL, Error>) -> Void) {
        
    }
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStorageManagerError>) -> Void) {
    bucket.child(reference).downloadURL(completion: {url, error in
    guard let url = url, error == nil else {
    completion(.failure(.failedToDownload))
    return
    }
        completion(.success(url))
    })
    }

}

public enum userPostType {
    case photo,video
}
///represent userpost
public struct UserPost {
    let identifier : String
    let postType : userPostType
    let thumbnailImage : URL
    let postURL: URL //either video url or full resolution photo
    let captain: String?
    let likecount:[postLikes]
    let comments: [postComment]
    let createdDate: Date

}
struct postLikes {
    let username: String
    let postİdentifier: String
}
struct commentLikes {
    let username: String
    let commentİdentifier: String
}
struct postComment {
    let identifier: String
    let username: String
    let text: String
    let createDate: Date
    let likes : [commentLikes]
}
