//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Максим Шагдыров on 23.04.2023.
//

import UIKit

class ProfileTableHeaderView: UIViewController {

    
    let header: ProfileHeaderView = {
        var header = ProfileHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false

        return header
    }()

    var posts = Source.makePost()
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

    override func viewDidLoad() {
        super.viewDidLoad()

        #if DEBUG
        view.backgroundColor = .white
        #else
        view.backgroundColor = .gray
        #endif

        setupUI()
        setupTableView()
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupUI() {
        view.addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 220),

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
}

extension ProfileTableHeaderView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
}
extension ProfileTableHeaderView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell
        else { fatalError() }
        cell.configure(posts: posts[indexPath.row])
        return cell
    }
}
