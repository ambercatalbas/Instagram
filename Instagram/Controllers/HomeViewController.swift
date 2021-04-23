//
//  ViewController.swift
//  Instagram
//
//  Created by Yasemin YEL on 17.04.2021.
//

import UIKit
import FirebaseAuth


class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
        do {
            try FirebaseAuth.Auth.auth().signOut()
        } catch {
            print("failed to signout")
        }
    }
    
    private func handleNotAuthenticated() {
        
        //check out status
        if  Auth.auth().currentUser == nil {
            //show login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
            
        } else {
            
            
        }
    }
    

}

