//
//  Users.swift
//  Navigation
//
//  Created by Максим Шагдыров on 13.06.2023.
//

import Foundation
import UIKit

class User {
    let login: String
    let fullName: String
    let avatar: UIImage
    let status: String

    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

let max = User(login: "max", fullName: "Max", avatar: UIImage(named: "avatar")!, status: "active")

protocol UserService {
    func getUser(withLogin login: String) -> User?
}

class CurrentUserService: UserService {
    private var currentUser = max

    func getUser(withLogin login: String) -> User? {
        guard login == currentUser.login else {
            return nil
        }
        return currentUser
    }
}


