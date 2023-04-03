//
//  PostViewController.swift
//  Navigation
//
//  Created by Максим Шагдыров on 08.03.2023.
//

import UIKit
import SwiftUI

class PostViewController: UIViewController {
    let nextButton = UIButton()
    let infoViewController = InfoViewController()
    var titlePost: String = "Some Title"
    var viewTitle = InfoView(title: "Мой первый пост")

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .lightGray
        self.navigationItem.title = titlePost

        let barButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(nextScreen)
        )

        navigationItem.rightBarButtonItem = barButton
    }

    @objc private func nextScreen() {
        if let info = infoViewController.sheetPresentationController {
            info.detents = [.large()]
        }
        present(infoViewController, animated: true)
    }
}
