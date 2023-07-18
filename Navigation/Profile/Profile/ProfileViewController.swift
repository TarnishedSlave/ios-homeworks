//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Максим Шагдыров on 23.04.2023.
//

import UIKit
import StorageService

protocol UserService {
    func getUser(login: String) -> User?
}

class User {
    let login: String
    let fullName: String
    let avatar: UIImage
    var status: String

    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

class CurrentUserService: UserService {
    func getUser(login: String) -> User? {
        if login == "john" {
            let user = User(login: "john", fullName: "John Doe", avatar: UIImage(named: "avatar") ?? UIImage(), status: "Active")
            return user
        } else {
            return nil
        }
    }
}

class TestUserService: UserService {
    let testUser: User

    init(testUser: User) {
        self.testUser = testUser
    }

    func getUser(login: String) -> User? {
        return testUser
    }
}

class ProfileViewController: UIViewController {

    var loginDelegate: LoginViewControllerDelegate?

    let header: ProfileHeaderView = {
        var header = ProfileHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .init(top: 20, left: 16, bottom: 20, right: 16)
        tableView.separatorColor = .gray
        return tableView
    }()

    var userService: UserService

    var user: User?

    init(userService: UserService) {
        self.userService = userService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        #if DEBUG
        view.backgroundColor = .systemPink
        userService = TestUserService(testUser: User(login: "test", fullName: "Test User", avatar: UIImage(named: "testuser") ?? UIImage(), status: "Still alive"))
        let login = "test"
        #else
        view.backgroundColor = .systemGreen
        userService = CurrentUserService()
        let login = "default"
        #endif

        setupUI()
        setupTableView()
        tableView.dataSource = self
        tableView.delegate = self

        user = userService.getUser(login: login)
        updateUI()
    }

    func setupUI() {
        view.addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 250),
        ])
    }

    func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    func updateUI() {
        guard let user = user else {
            return
        }

        header.fullNameLabel.text = user.fullName
        header.avatarImageView.image = user.avatar
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else {
            fatalError()
        }

        cell.configure(posts: posts[indexPath.row])
        return cell
    }
}
