//
//  NotificationViewController.swift
//  Instagram
//
//  Created by Yasemin YEL on 17.04.2021.
//

import UIKit

enum UserNotificationType {
    case like(post: UserPost)
    case follow
}
struct UserNotification {
    let type: UserNotificationType
    let text: String
    let user: User
    
}
final class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.register(NotificationLikeEventTableViewCellTableViewCell.self, forCellReuseIdentifier: NotificationLikeEventTableViewCellTableViewCell.identifier)
        
        tableView.register(NotificationFollowEventTableViewCell.self, forCellReuseIdentifier: NotificationFollowEventTableViewCell.identifier)
        tableView.isHidden = false
        return tableView
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()
    private lazy var noNotificationsView = NoNotificationsView()
    
    private var models = [UserNotification]()
    
    ///MARK: Lifesycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNotifications()

        navigationItem.title = "Notifications"
        view.backgroundColor = .systemBackground
        view.addSubview(spinner)
        //spinner.startAnimating()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinner.center = view.center
        
     }
    private func fetchNotifications() {
        for x in 0...100 {
            let post = UserPost(identifier: "",
                                postType: .photo,
                                thumbnailImage: URL(string: "htttps://www.google.com")!,
                                postURL: URL(string: "htttps://www.google.com")!,
                                captain: nil,
                                likecount: [],
                                comments: [],
                                createdDate: Date(),
                                taggedUsers: [])
            let model = UserNotification(type: x % 2 == 0 ? .like(post: post) : .follow,
                                         text: "hello world",
                                         user: User(username: "joe",
                                                    bio: "",
                                                    name: (first: "", last: ""),
                                                    profilePhoto: URL(string: "htttps://www.google.com")!,
                                                    birthDate: Date(),
                                                    gender: .male,
                                                    counts: UserCount(followers: 1, following: 1, posts: 1), joinDate: Date()))
            models.append(model)
            
        }
    }
    private func addNotificationsView() {
        tableView.isHidden = true
        view.addSubview(tableView)
        noNotificationsView.frame = CGRect(x: 0, y: 0, width: view.width/2, height: view.width/2)
        noNotificationsView.center = view.center
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model.type {
        case .like(_):
            //like cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLikeEventTableViewCellTableViewCell.identifier,
                                                     for: indexPath) as! NotificationLikeEventTableViewCellTableViewCell
            cell.configure(with: model)
            cell.delegate = self
            return cell
        case .follow:
            // follow cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationFollowEventTableViewCell.identifier,
                                                           for: indexPath) as! NotificationFollowEventTableViewCell
            //cell.configure(with: model)
        return cell
        
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexpath: IndexPath) -> CGFloat {
        return 52
    }
    
}

extension Notification
