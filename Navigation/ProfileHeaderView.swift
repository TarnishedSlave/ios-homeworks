import UIKit
import SnapKit

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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureContents() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        backgroundColor = .white

        avatarImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(80)
        }

        // fullNameLabel constraints
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(27)
            make.left.equalTo(avatarImageView.snp.right).offset(40)
            make.centerY.equalTo(avatarImageView.snp.centerY).inset(14)
            make.right.equalToSuperview().inset(90)
        }

        // statusLabel constraints
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(fullNameLabel.snp.bottom).inset(16)
            make.left.equalTo(avatarImageView.snp.right).offset(40)
            make.right.equalToSuperview().inset(16)
        }

        // statusTextField constraints
        statusTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(statusLabel.snp.bottom).offset(16)
            make.left.equalTo(avatarImageView.snp.right).offset(40)
        }

        // setStatusButton constraints
        setStatusButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(avatarImageView.snp.bottom).offset(78)
            make.height.equalTo(50)
        }
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




