import UIKit

class ProfileHeaderView: UIView {


    private let avatarImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "avatar")
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 30
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()

        private let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Макс"
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        private let statusLabel: UILabel = {
            let label = UILabel()
            label.text = "В ожидании статуса..."
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        private let button: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemBlue
            button.setTitle("Покажи статус", for: .normal)
            button.layer.cornerRadius = 4
            button.layer.masksToBounds = false
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.shadowRadius = 4
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.7
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupSubviews()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupSubviews() {
            addSubview(avatarImageView)
            addSubview(nameLabel)
            addSubview(statusLabel)
            addSubview(button)

            NSLayoutConstraint.activate([
                avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
                avatarImageView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -16),
                avatarImageView.widthAnchor.constraint(equalToConstant: 60),
                avatarImageView.heightAnchor.constraint(equalToConstant: 60),

                nameLabel.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 27),
                nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

                statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
                statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                statusLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
                button.heightAnchor.constraint(equalToConstant: 50)
            ])

            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        }

        @objc private func buttonPressed() {
            guard let statusText = statusLabel.text else { return }
            print("Status text: \(statusText)")
        }
    }
