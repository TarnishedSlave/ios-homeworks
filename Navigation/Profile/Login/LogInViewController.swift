//
//  LogInViewController.swift
//  Navigation
//
//  Created by Максим Шагдыров on 23.04.2023.
//

import UIKit

final class LogInViewController: UIViewController, UIScrollViewDelegate {

    // MARK: - Private properties
    
    private let userService: UserService
    private var currentUser: User?

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.translatesAutoresizingMaskIntoConstraints    = false
        loginTextField.placeholder = "Email or phone"
        loginTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginTextField.textColor = .black
        loginTextField.tintColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        loginTextField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        loginTextField.layer.cornerRadius = 10
        loginTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
        loginTextField.layer.borderWidth = 0.5
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.autocapitalizationType = .none
        loginTextField.autocorrectionType = .no
        loginTextField.keyboardType = UIKeyboardType.default
        loginTextField.returnKeyType = UIReturnKeyType.done
        loginTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        loginTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        loginTextField.delegate = self
        return loginTextField
    }()
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.textColor = .black
        passwordTextField.tintColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        passwordTextField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passwordTextField.delegate = self
        return passwordTextField
    }()
    
    private let buttonLogIn: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(nil, action: #selector(logIn), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()

    
    // MARK: - Lifecycles
    
    init(userService: UserService) {
        self.userService = userService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setupKeyboardObservers()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeKeyboardObservers()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        scrollView.addSubview(buttonLogIn)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),

            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),

            buttonLogIn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            buttonLogIn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            buttonLogIn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard),
            name: UIResponder.keyboardDidHideNotification,
            object: nil)
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func willShowKeyboard(_notification: NSNotification) {
        let keyboardHeight = (_notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }

    @objc func logIn(sender: UIButton) {
            guard let login = loginTextField.text, let user = userService.getUser(withLogin: login) else {
                let alert = UIAlertController(title: "Unknown login", message: "Please enter a valid login", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                present(alert, animated: true)
                return
            }

            currentUser = user

            let profileVC = ProfileViewController(user: user)
            navigationController?.pushViewController(profileVC, animated: true)
        }
    
}



    // MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
