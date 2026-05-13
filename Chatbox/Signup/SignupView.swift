//
//  SignupView.swift
//  Chatbox
//
//  Created by admin on 13.05.2026.
//

import UIKit

class SignupView: UIViewController, ISignupView {
    
    let hPadding = CGFloat(24)
    var presenter: ISignupPresenter?
    
    //MARK: - Text
    lazy var titleLabel: UnderlinedLabel = {
        let undetlinedLabel = UILabel()
        undetlinedLabel.translatesAutoresizingMaskIntoConstraints = false
        undetlinedLabel.text = "Email"
        undetlinedLabel.setupSmallTitle()
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign up with "
        label.setupSmallTitle()
        
        let uLabel = UnderlinedLabel(underlinedLabel: undetlinedLabel, label: label, inverQueue: true)
        return uLabel
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Get chatting with friends and family today by\nsigning up for our chat app!"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray2
        label.setLineHeight(height: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Inputs
    var inputName = Input(name: "Your name")
    var inputEmail = Input(name: "Your email")
    var inputPassword = Input(name: "Password")
    var inputConfirm = Input(name: "Confirm Password")
    
    //MARK: - Buttons
    var button = Button(text: "Create an account", type: .accent)
    var backButton = BackButton()
    
    override func viewDidLoad() {
        setupDismissKeyboardOnTap()
        
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(textLabel)
        
        view.addSubview(inputName)
        view.addSubview(inputEmail)
        view.addSubview(inputPassword)
        view.addSubview(inputConfirm)
        
        view.addSubview(button)
        view.addSubview(backButton)
        backButton.action = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            
            inputName.topAnchor.constraint(lessThanOrEqualTo: textLabel.bottomAnchor, constant: 60),
            inputName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: hPadding),
            inputName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -hPadding),
            
            inputEmail.topAnchor.constraint(lessThanOrEqualTo: inputName.bottomAnchor, constant: 30),
            inputEmail.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: hPadding),
            inputEmail.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -hPadding),
            
            inputPassword.topAnchor.constraint(lessThanOrEqualTo: inputEmail.bottomAnchor, constant: 30),
            inputPassword.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: hPadding),
            inputPassword.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -hPadding),
            
            inputConfirm.topAnchor.constraint(lessThanOrEqualTo: inputPassword.bottomAnchor, constant: 30),
            inputConfirm.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: hPadding),
            inputConfirm.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -hPadding),
            inputConfirm.bottomAnchor.constraint(lessThanOrEqualTo: view.keyboardLayoutGuide.topAnchor, constant: -20),
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: hPadding),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hPadding),
            
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: hPadding),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
        ])
    }
}

protocol ISignupView: AnyObject {
    
}
