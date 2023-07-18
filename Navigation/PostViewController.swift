//
//  PostLogInViewController.swift
//  Navigation
//
//  Created by Максим Шагдыров on 23.04.2023.
//

import UIKit

class PostViewController: UIViewController {


    private var data: Post? = nil


    func update(model: Post) {
        data = model

        // navigationItem.title = model.author

    }
}
