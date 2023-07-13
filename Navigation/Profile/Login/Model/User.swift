//
//  Users.swift
//  Navigation
//
//  Created by Максим Шагдыров on 13.06.2023.
//

import UIKit

final class User {
    let login: String
    let fullName: String
    var avatar: UIImage
    var status: String

    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

