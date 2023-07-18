//
//  Users.swift
//  Navigation
//
//  Created by Максим Шагдыров on 13.06.2023.
//

import Foundation
import UIKit

struct User {
    var userLogin: String
    var userAvatar: UIImage?
    var userName: String
    var userStatus: String

//    init(userLogin: String, userAvatar: UIImage?, userName: String, userStatus: String) {
//        self.userLogin = userLogin
//        self.userAvatar = userAvatar
//        self.userName = userName
//        self.userStatus = userStatus
//    }
}
enum UserServiceError: Error {
    case wrongLogin
//    case wrongPassword
}
protocol UserService {
    func logInToUser(_ userLogin: String?) -> Result<User, UserServiceError>
}

internal var userData: [User] = [
    User(userLogin: "max", userAvatar: UIImage(named: "avatar"), userName: "Max", userStatus: "Still alive")
]

class CurrentUserService: UserService {

    func logInToUser(_ userLogin: String?) -> Result<User, UserServiceError> {
        if let index = userData.firstIndex(where: {$0.userLogin == userLogin}) {
            if userLogin == userData[index].userLogin {
                return .success(userData[index])
            } else {
                return .failure(.wrongLogin)
            }
        } else {
            return .failure(.wrongLogin)
        }
    }

}

class TestUserService: UserService {

    let userCat = User(
        userLogin: "test",
        userAvatar: UIImage(named: "testuser"),
        userName: "testuser",
        userStatus: "I love test"
    )

    func logInToUser(_ userLogin: String?) -> Result<User, UserServiceError> {
        guard let userLogin = userLogin else {
            return .failure(.wrongLogin)
        }
        guard userLogin == userCat.userLogin else {
            return .failure(.wrongLogin)
        }
        return .success(userCat)
    }



}
