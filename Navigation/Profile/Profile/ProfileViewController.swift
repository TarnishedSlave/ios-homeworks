//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Максим Шагдыров on 23.04.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Private properties

    var posts = Source.makePost()
    var user: User
    var userService: UserService

    private var headerView: ProfileHeaderView?

    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.id)
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .init(top: 20, left: 16, bottom: 20, right: 16)
        tableView.separatorColor = .gray
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.tableHeaderView = header
        return tableView
    }()



    // MARK: - Initializer

    init(userService: UserService) {
            self.userService = userService
            self.user = User(login: "", fullName: "", avatar: UIImage(), status: "")
            super.init(nibName: nil, bundle: nil)
            self.user = userService.getUser(withLogin: "max") ?? self.user
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupConstraints()
        updateUI()
        tableView.delegate = self
    }
    
    
    // MARK: - Private methods
    
    private func setupView() {
        #if DEBUG
            view.backgroundColor = .white
        userService = TestUserService(testUser: User(login: "test", fullName: "test", avatar: UIImage(named: "testuser") ?? UIImage(), status: "testing"))
        #else
            view.backgroundColor = .gray
            userService = CurrentUserService()
        #endif
        self.navigationController?.navigationBar.isHidden = true
    }

    func updateUI() {
        headerView!.fullNameLabel.text = user.fullName
        headerView!.avatarImageView.image = user.avatar
        headerView!.statusLabel.text = user.status
    }

    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}



    // MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(posts: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.id) as? ProfileHeaderView
            return headerView
        }
        return nil
    }
}



    // MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 300
        } else {
            return 0
        }
    }
}
