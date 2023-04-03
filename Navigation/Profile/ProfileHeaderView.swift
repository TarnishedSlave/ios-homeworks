import SwiftUI
import UIKit

class ProfileHeaderView: UIView {

    //cоздаем переменные
    let image = UIImageView()
    let nameLabel = UILabel()
    var statusLabel = UILabel()
    var statusTextField = UITextField()
    let button = UIButton()
    private var statusText: String = ""
    lazy var topConstraint = image.topAnchor.constraint(equalTo:
                                                            safeAreaLayoutGuide.topAnchor, constant: 16)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        //super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout(){
        configureAvatar()
        configureLabel()
        configureStatusLabel()
        configureTextField()
        configureButton()

    }

    func configureAvatar() {
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "avatar")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 75
        image.layer.masksToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor

        NSLayoutConstraint.activate([
            topConstraint,
            image.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            image.widthAnchor.constraint(equalToConstant: 150),
            image.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    func configureLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Максим"
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 200),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    func configureStatusLabel() {
        addSubview(statusLabel)
        statusLabel.text = "В ожидании"
        statusLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 45),
            statusLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 200),
            statusLabel.heightAnchor.constraint(equalToConstant: 150),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }

    func configureTextField (){
        addSubview(statusTextField)
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.borderStyle = .roundedRect
        statusTextField.placeholder = ""
        //statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 140),
            statusTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 200),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    func configureButton (){
        addSubview(button)
        button.backgroundColor = .systemBlue
        button.setTitle("Покажи статус", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = false
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        NSLayoutConstraint.activate([
            //button.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 30)
        ])
    }


    @objc func statusTextChanged() {

    }

    @objc func buttonPressed() {

    }
}


