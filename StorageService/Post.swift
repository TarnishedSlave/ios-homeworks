//
//  Post.swift
//  StorageService
//
//  Created by Максим Шагдыров on 24.05.2023.
//

import UIKit

public struct Post {
    public var title: String
    public  var author: String
    public  var image = UIImage()
    public  var description: String
    public  var likes: Int
    public  var view: Int
}

public var publicPost  = Post(title: "Мой пост", author: "PS5", image: UIImage(named: "PS5")!, description: Description.summerDescript, likes: 100, view: 210)

public var posts : [Post] = [
    Post(title: "Мой пост", author: "Car", image: UIImage(named: "Car")!, description: Description.summerDescript, likes: 100, view: 210),
    Post(title: "Мой пост", author: "Reading", image: UIImage(named: "Books")!, description: Description.winterDescript, likes: 134, view: 542),
    Post(title: "Мой пост", author: "Gaming", image: UIImage(named: "PS5")!, description: Description.springDescript, likes: 311, view: 236),
    Post(title: "Мой пост", author: "Basketball", image: UIImage(named: "Sport")!, description: Description.automneDescript, likes: 111, view: 300)
]

struct Description {
    static let summerDescript = "I like cars"
    static let winterDescript = "I like reading"
    static let springDescript = "I like gaming"
    static let automneDescript = "I like play a basketball"
}
