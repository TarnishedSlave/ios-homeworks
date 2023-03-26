import UIKit

class ProfileViewController: UIViewController {

    private let profileHeaderView = ProfileHeaderView()
    let head = UIView (
        frame: CGRect(x: 0, y: 0, width: 300, height: 80))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(profileHeaderView)
        profileHeaderView.addSubview(head)
    }

}
