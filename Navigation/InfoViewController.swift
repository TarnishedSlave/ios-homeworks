//
//  InfoViewController.swift
//  Navigation
//
//  Created by Максим Шагдыров on 08.03.2023.
//

import UIKit

class InfoViewController: UIViewController {
    let button = UIButton(type: .system)
    let alertTitle = "Заголовок"
    let alertMessage = "Сообщение"

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(button)
        setupButton()
    }

    private func setupButton() {
        button.setTitle("Показать alert", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        setupConstraint()
    }

    @objc private func showAlert() {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            print("Нажата кнопка 'Отмена'")
        }
        alert.addAction(cancelAction)
        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
            print("Нажата кнопка 'ОК'")
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    func setupConstraint() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
