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

class TestUserService{

    // MARK: - Private properties

    private var testUser: User


    // MARK: - Init
    init(testUser: User) {
        self.testUser = testUser
    }

}


    // MARK: - UserService

extension CurrentUserService: UserService {
    
    func getUser(withLogin login: String) -> User? {
        if login == "max" {
            let user = User(login: "max", fullName: "Max", avatar: UIImage(named: "avatar") ?? UIImage(), status: "Still alive")
            return user
        } else {
            return nil
        }
    }
}

extension TestUserService: UserService {

    func getUser(withLogin login: String) -> User? {
        if login == "test" {
            let user = User(login: "test", fullName: "test", avatar: UIImage(named: "testuser") ?? UIImage(), status: "i love Swift")
            return user
        } else {
            return nil
        }
    }
}


