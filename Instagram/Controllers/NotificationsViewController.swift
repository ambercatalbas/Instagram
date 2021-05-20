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
        tableView.register(NotificationlLikeEventTableViewCellTableViewCell.self, forCellReuseIdentifier: NotificationlLikeEventTableViewCellTableViewCell.identifier)
        
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
    
    ///MARK: Lifesycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    private func layoutNotificationsView() {
        tableView.isHidden = true
        view.addSubview(tableView)
        noNotificationsView.frame = CGRect(x: 0, y: 0, width: view.width/2, height: view.width/2)
        noNotificationsView.center = view.center
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
