//
//  Photos.swift
//  Navigation
//
//  Created by Максим Шагдыров on 18.07.2023.
//

import Foundation
import UIKit
struct Photo {
    let imageTitle: String
}
extension Photo {
    static func make() -> [Photo] {
        [
            Photo(imageTitle: "photo1"),
            Photo(imageTitle: "photo2"),
            Photo(imageTitle: "photo3"),
            Photo(imageTitle: "photo4"),
            Photo(imageTitle: "photo5"),
            Photo(imageTitle: "photo6")
        ]
    }
}
