//
//  UserService.swift
//  Navigation
//
//  Created by Илья Сидорик on 14.06.2023.
//

import UIKit

protocol UserService {
    func getUser(withLogin login: String) -> User?
}


class CurrentUserService{
    
    // MARK: - Private properties
    
    private var currentUser: User
    
    
    // MARK: - Init
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }
    
}



// MARK: - UserService

extension CurrentUserService: UserService {
    
    func getUser(withLogin login: String) -> User? {
        if login == "max" {
            let user = User(login: "max", fullName: "Max", avatar: UIImage(named: "magic") ?? UIImage(), status: "Active")
            return user
        } else {
            return nil
        }
    }
}
