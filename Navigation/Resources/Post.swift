//
//  Post.swift
//  StorageService
//
//  Created by Максим Шагдыров on 24.05.2023.
//

import UIKit
import Foundation

public struct Post {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}
extension Post {
    static func make() -> [Post] {
        [
            Post(
                 author: "Car",
                 description: "I like cars",
                 image: "Car",
                 likes: 1,
                 views: 1
            ),
            Post(
                author: "Reading",
                description: "I like reading",
                image: "Books",
                likes: 2,
                views: 2
            ),
            Post(
                author: "Gaming",
                description: "I like play some PS5 games",
                image: "PS5",
                likes: 3,
                views: 3
            ),
            Post(
                author: "Basketball",
                description: "I like sport",
                image: "Sport",
                likes: 4,
                views: 4
            )
        ]
    }
}

//import UIKit
//
//public struct Post {
//    public var title: String
//    public  var author: String
//    public  var image = UIImage()
//    public  var description: String
//    public  var likes: Int
//    public  var view: Int
//}
//
//public var publicPost  = Post(title: "Мой пост", author: "PS5", image: UIImage(named: "PS5")!, description: Description.summerDescript, likes: 100, view: 210)
//
//public var posts : [Post] = [
//    Post(title: "Мой пост", author: "Car", image: UIImage(named: "Car")!, description: Description.summerDescript, likes: 100, view: 210),
//    Post(title: "Мой пост", author: "Reading", image: UIImage(named: "Books")!, description: Description.winterDescript, likes: 134, view: 542),
//    Post(title: "Мой пост", author: "Gaming", image: UIImage(named: "PS5")!, description: Description.springDescript, likes: 311, view: 236),
//    Post(title: "Мой пост", author: "Basketball", image: UIImage(named: "Sport")!, description: Description.automneDescript, likes: 111, view: 300)
//]
//
//struct Description {
//    static let summerDescript = "I like cars"
//    static let winterDescript = "I like reading"
//    static let springDescript = "I like gaming"
//    static let automneDescript = "I like play a basketball"
//}
