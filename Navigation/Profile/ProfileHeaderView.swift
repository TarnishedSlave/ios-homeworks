import UIKit

    class ProfileHeaderView: UIView {

        private let avatarImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "avatar")
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 50
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()

        private let fullNameLabel: UILabel = {
            let label = UILabel()
            label.text = "Максим"
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        private let statusLabel: UILabel = {
            let label = UILabel()
            label.text = "В ожидании..."
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        private let statusTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Введите новый статус"
            textField.borderStyle = .roundedRect
            textField.layer.cornerRadius = 5
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()


        private let setStatusButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemBlue
            button.setTitle("Статус", for: .normal)
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = false
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.shadowRadius = 4
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.7
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

//        private let newButton: UIButton = {
//            let button = UIButton()
//            button.backgroundColor = .red
//            button.setTitle("New Button", for: .normal)
//            button.layer.cornerRadius = 4
//            button.layer.masksToBounds = false
//            button.layer.shadowOffset = CGSize(width: 4, height: 4)
//            button.layer.shadowRadius = 4
//            button.layer.shadowColor = UIColor.black.cgColor
//            button.layer.shadowOpacity = 0.7
//            button.translatesAutoresizingMaskIntoConstraints = false
//            return button
//        }()
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupSubviews()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupSubviews() {
            addSubview(avatarImageView)
            addSubview(fullNameLabel)
            addSubview(statusLabel)
            addSubview(statusTextField)
            addSubview(setStatusButton)
            //addSubview(newButton)

            NSLayoutConstraint.activate([
                avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
                avatarImageView.widthAnchor.constraint(equalToConstant: 100),
                avatarImageView.heightAnchor.constraint(equalToConstant: 100),


                fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 100),
                fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),

                statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor, constant: 0),
                statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 60),

                statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
                statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),

                setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 8),
                setStatusButton.heightAnchor.constraint(equalToConstant: 50),

                statusTextField.trailingAnchor.constraint(equalTo: setStatusButton.leadingAnchor, constant: -8),
                setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)

//                newButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//                newButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//                newButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
//                newButton.heightAnchor.constraint(equalToConstant: 36)
            ])

            setStatusButton.addTarget(self, action: #selector(setStatus), for: .touchUpInside)
        }

        @objc private func setStatus() {
            guard let newStatus = statusTextField.text else { return }
            statusLabel.text = newStatus
            statusTextField.text = ""
        }
    }


