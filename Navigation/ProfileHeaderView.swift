import UIKit

class User {
    let login: String
    let fullName: String
    let avatar: UIImage?
    let status: String

    init(login: String, fullName: String, avatar: UIImage?, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

protocol UserService {
    func getUser(withLogin login: String) -> User?
}

class CurrentUserService: UserService {
    private var currentUser: User?

    init(user: User?) {
        self.currentUser = user
    }

    func getUser(withLogin login: String) -> User? {
        guard login == currentUser?.login else {
            return nil
        }
        return currentUser
    }
}

final class ProfileHeaderView: UIView, UITextFieldDelegate {

    

    private let avatarImageView: UIImageView = {
        let imageView                        = UIImageView()
        imageView.image                      = UIImage(named: "avatar")
        imageView.contentMode                = .scaleAspectFill
        imageView.layer.cornerRadius         = 40
        imageView.layer.masksToBounds        = true
        imageView.layer.borderWidth          = 3
        imageView.layer.borderColor          = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fullNameLabel: UILabel = {
        let label                      = UILabel()
        label.text                     = "Максим"
        label.font                     = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor                = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let statusLabel: UILabel = {
        let label                    = UILabel()
        label.text                   = "В ожидании..."
        label.font                   = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor              = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var user: User? {
            didSet {
                if let user = user {
                    fullNameLabel.text = user.fullName
                    statusLabel.text = user.status
                    avatarImageView.image = user.avatar
                } else {
                    fullNameLabel.text = nil
                    statusLabel.text = nil
                    avatarImageView.image = nil
                }
            }
        }

    private let statusTextField: UITextField           = {
        let text                                       = UITextField()
        text.placeholder                               = "Listening to music"
        text.font                                      = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor                                 = .black
        text.layer.cornerRadius                        = 12
        text.layer.backgroundColor                     = UIColor.white.cgColor
        text.layer.borderWidth                         = 1
        text.layer.borderColor                         = UIColor.black.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        let paddingView                                = UIView(frame: CGRectMake(0, 0, 14, 0))
        text.leftView                                  = paddingView
        text.leftViewMode                              = UITextField.ViewMode.always
        return text
    }()

    private var statusText: String = ""

    private let setStatusButton: UIButton               = {
        let button                                      = UIButton()
        button.setTitle("Set status", for: .normal)
        button.titleLabel?.font                         = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor                          = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        button.titleLabel?.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius                       = 4
        button.layer.cornerRadius                       = 12
        button.layer.shadowColor                        = UIColor.black.cgColor
        button.layer.shadowOpacity                      = 0.7
        button.addTarget(nil, action: #selector(buttonPressed), for: .editingChanged)
        button.addTarget(nil, action: #selector(statusTextChanged), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()

        
        //backgroundColor = .systemGray6
    }
    func configureContents() {

        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        backgroundColor = .white
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
            avatarImageView.widthAnchor.constraint(equalToConstant: 80),

            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 40),
            fullNameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: -14),
            fullNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -90),
            fullNameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -16),

            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),
            statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 40),
            statusLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -16),

            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -24),
            statusTextField.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 40),

            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 78),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func buttonPressed(sender: UIButton) {
        print(statusText)
    }
    @objc func statusTextChanged(_textField: UITextField) {
        statusLabel.text! = statusTextField.text!
        setStatusButton.isHidden = statusTextField.text?.isEmpty ?? true
        print("Text changed \(statusLabel.text!)")
    }

}
