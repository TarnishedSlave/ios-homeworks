//
//  Source.swift
//  Navigation
//
//  Created by Максим Шагдыров on 23.04.2023.
//

import UIKit

struct Posts {
    var author: String
    var image = UIImage()
    var description: String
    var likes: Int
    var view: Int
}

struct Description {
    static let sport = "I like basketball"
    static let books = "I like reading"
    static let games = "I like PS5"
    static let car = "I like my car"
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
