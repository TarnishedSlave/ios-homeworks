//
//  LogInViewController.swift
//  Navigation
//
//  Created by Максим Шагдыров on 23.04.2023.
//

import UIKit

class CustomButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            if (isHighlighted) {
                alpha = 0.8
            } else {
                alpha = 1
            }
        }
    }
    override var isSelected: Bool {
        didSet {
            if (isSelected) {
                alpha = 0.8
            } else {
                alpha = 1
            }
        }
    }
}

class LogInViewController: UIViewController, UIScrollViewDelegate {

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
        stackView.alignment = .center
        stackView.distribution = .fillEqually

        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(buttonLogIn)

        stackView.setCustomSpacing(120, after: logoImageView)
        stackView.setCustomSpacing(0, after: loginTextField)
        stackView.setCustomSpacing(16, after: passwordTextField)

        return stackView
    }()
    private let logoImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "logo"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Email or phone"
        loginTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginTextField.textColor = .black
        loginTextField.tintColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        loginTextField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] //?
        loginTextField.layer.cornerRadius = 10
        loginTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
        loginTextField.layer.borderWidth = 0.5
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.autocapitalizationType = .none
        loginTextField.autocorrectionType = .no
        loginTextField.keyboardType = UIKeyboardType.default
        loginTextField.returnKeyType = UIReturnKeyType.done
        loginTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        loginTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        let paddingView = UIView(frame: CGRectMake(0, 0, 14, 0))
        loginTextField.leftView = paddingView
        loginTextField.leftViewMode = UITextField.ViewMode.always
        return loginTextField
    }()
    private let passwordTextField: UITextField = {
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
        let paddingView = UIView(frame: CGRectMake(0, 0, 14, 0))
        passwordTextField.leftView = paddingView
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        return passwordTextField
    }()
    private let buttonLogIn: CustomButton = {
        let button = CustomButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(nil, action: #selector(logIn), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        addSubview()
        setupContentOfScrollView()
        setupUI()
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupKeyboardObservers()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }
    @objc func willShowKeyboard(_notification: NSNotification) {
        let keyboardHeight = (_notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    @objc func logIn(sender: UIButton) {
        let profileVC = ProfileTableHeaderView()
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    private func addSubview() {
        scrollView.addSubview(stackView)
    }
    private func  setupContentOfScrollView() {
        for _ in 0...2 {
            loginTextField.translatesAutoresizingMaskIntoConstraints = false
            stackView.addSubview(loginTextField)
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            stackView.addSubview(passwordTextField)
            buttonLogIn.translatesAutoresizingMaskIntoConstraints = false
            stackView.addSubview(buttonLogIn)
            if stackView.subviews.count > 0 {
                let previousLabel = stackView.subviews.dropLast().last
                previousLabel?.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
            } else {
                loginTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor).isActive = true
            }
        }
        stackView.subviews.last?.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
    }
    private func setupUI() {
        scrollView.addSubview(stackView)
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(buttonLogIn)
//        stackView.addArrangedSubview(loginTextField)
//        stackView.addArrangedSubview(passwordTextField)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: loginTextField.topAnchor, constant: -120),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),

            loginTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            //loginTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            //loginTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 0),

            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
//            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0),
//            passwordTextField.bottomAnchor.constraint(equalTo: buttonLogIn.topAnchor, constant: -16),

            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
            buttonLogIn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            buttonLogIn.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            buttonLogIn.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
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
}
extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
