//
//  LoginView.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

import UIKit

class LoginView: UIViewController, ILoginView {
    
    let hPadding = CGFloat(24)
    
    var presenter: ILoginPresenter?
    
    //MARK: - Text
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Log in to Chatbox"
        label.setupSmallTitle()
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome back! Sign in using your social\naccount or email to continue us"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray2
        label.setLineHeight(height: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Socials
    var socials = SocialsView(isDark: true)
    var divider = DividerOR(isDark: true)
    
    //MARK: - Inputs
    var inputEmail = Input(name: "Your email")
    var inputPassword = Input(name: "Password")
    
    //MARK: - Buttons
    var button = Button(text: "Log in", type: .accent)
    var forgotPswButton = Subbutton(label: "Forgot password?")
    
    override func viewDidLoad() {
        setupDismissKeyboardOnTap()
        
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(textLabel)
        
        view.addSubview(socials)
        view.addSubview(divider)
        
        view.addSubview(inputEmail)
        view.addSubview(inputPassword)
        
        view.addSubview(button)
        view.addSubview(forgotPswButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            
            socials.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            socials.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 30),
            divider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divider.topAnchor.constraint(lessThanOrEqualTo: socials.bottomAnchor, constant: 30),
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: hPadding),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hPadding),
            
            inputEmail.topAnchor.constraint(lessThanOrEqualTo: divider.bottomAnchor, constant: 50),
            inputEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: hPadding),
            inputEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hPadding),
            inputEmail.bottomAnchor.constraint(lessThanOrEqualTo: view.keyboardLayoutGuide.topAnchor, constant: -20),
            
            inputPassword.topAnchor.constraint(equalTo: inputEmail.bottomAnchor, constant: 30),
            inputPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: hPadding),
            inputPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hPadding),
            inputPassword.bottomAnchor.constraint(lessThanOrEqualTo: view.keyboardLayoutGuide.topAnchor, constant: -20),
            
            button.bottomAnchor.constraint(equalTo: forgotPswButton.topAnchor, constant: -10),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: hPadding),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hPadding),
            forgotPswButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            forgotPswButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

protocol ILoginView: AnyObject {
    var presenter: ILoginPresenter? { get set }
}
