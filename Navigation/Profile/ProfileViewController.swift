import UIKit
import SwiftUI

class ProfileViewController: UIViewController {

    let headerView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(headerView)
        self.view.backgroundColor = UIColor.lightGray
        headerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Ограничение слева и справа нулевые отступы
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            // Ограничение сверху к Safe Area
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            // Задайте высоту равной 220
            headerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.frame = view.bounds
    }
 
}
