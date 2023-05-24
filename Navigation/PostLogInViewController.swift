//
//  PostLogInViewController.swift
//  Navigation
//
//  Created by Максим Шагдыров on 23.04.2023.
//

import UIKit

class PostLogInViewController: UIViewController {

    var titlePost: String = "Posts"
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonPressed))
        navigationItem.rightBarButtonItem = button
        setupView()
    }
    @objc func buttonPressed(_sender: UIButton) {
        let infoViewController = InfoViewController()
        infoViewController.modalPresentationStyle = .pageSheet
        present(infoViewController, animated: true)
    }
    func setupView() {
        self.view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.navigationItem.title = titlePost
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
