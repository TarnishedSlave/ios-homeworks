//
//  Source.swift
//  Navigation
//
//  Created by Максим Шагдыров on 23.04.2023.
//

import UIKit

struct Posts {
    var author:      String
    var image =      UIImage()
    var description: String
    var likes:       Int
    var view:        Int
}

struct Description {
    static let sport = "I like basketball"
    static let books = "I like reading"
    static let games = "I like PS5"
    static let car   = "I like my car"
}

struct Source {
    static func makePost() -> [Posts] {
        [
            .init(author: "Basketball", image: UIImage(named: "Sport")!, description: Description.sport, likes: 1, view: 1),
            .init(author: "Reading", image: UIImage(named: "Books")!, description: Description.books, likes: 1, view: 1),
            .init(author: "Playing", image: UIImage(named: "PS5")!, description: Description.games, likes: 1, view: 1),
            .init(author: "My Car", image: UIImage(named: "Car")!, description: Description.car, likes: 1, view: 1)
        ]
    }
}
//Добавьте новый класс User для хранения информации о
//пользователе со свойствами: логин, полное имя, аватар, статус.
//Типы для свойств — String, за исключением аватара, который должен иметь тип UIImage.
class User {
    let login: String
    let fullName: String
    let avatar = UIImage()
    let status: String

    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.status = status
    }
}

//Добавьте новый протокол UserService с функцией,
//которая в качестве аргумента принимает логин и возвращает объект класса User?.
//То есть, в случае неверного логина, пользователь не будет авторизован.
protocol UserService {
    func getUser(login: String) -> User?
}

//Добавьте класс CurrentUserService, зависимый от протокола UserService.
//Класс хранит объект класса User
//и возвращает его в функции, реализующей протокол, если,
//конечно, переданный логин соответствует логину имени пользователя.
class CurrentUserService: UserService {
    private let user: User

    init(user: User) {
        self.user = user
    }

    func getUser(login: String) -> User? {
        guard login == user.login else {
            return nil
        }
        return user
    }
}

