//
//  FeedViewController.swift
//  Navigation
//
//  Created by Максим Шагдыров on 08.03.2023.
//

import UIKit

class FeedViewController: UIViewController {
    let postScreen = PostViewController()
    let nextButton = UIButton()
    var post = Post(title: "Мой постище")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    setupButton()
    }

    @objc func goToPostScreen() {
        navigationController?.pushViewController(postScreen, animated: true)
        postScreen.titlePost = post.title
    }

    func setupButton (){
        view.addSubview(nextButton)

        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemPink
        nextButton.addTarget(self, action: #selector(goToPostScreen), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
