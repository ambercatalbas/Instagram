//
//  Models.swift
//  Instagram
//
//  Created by Yasemin YEL on 29.04.2021.
//

import Foundation

enum Gender {
    case male, female, other
}
struct User {
    let username: String
    let bio: String
    let name: (firstname: String, lastname: String)
    let profilePhoto: URL
    let birthDate: Date
    let gender: Gender
    let counts : UserCount
    let joinDate: Date
    
}
struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
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
    let taggedUsers: [User]

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
