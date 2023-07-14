//
//  LoginDelegate.swift
//  Navigation
//
//  Created by Максим Шагдыров on 14.07.2023.
//

import Foundation

class LoginDelegate: LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool {
        return Checker.shared.check(login: login, password: password)
    }
}
