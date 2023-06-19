//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Максим Шагдыров on 23.04.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Private properties

    
    private var posts = Source.makePost()
    private var user: User
    
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

    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
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
    }
    
    
    // MARK: - Private methods
    
    private func setupView() {
        #if DEBUG
            view.backgroundColor = .white
        #else
            view.backgroundColor = .gray
        #endif
        self.navigationController?.navigationBar.isHidden = true
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
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.id) as? ProfileHeaderView else {
                return nil
            }
            return header
        } else {
            return nil
        }
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
