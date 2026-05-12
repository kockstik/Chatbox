//
//  OnboardingView.swift
//  Chatbox
//
//  Created by admin on 11.05.2026.
//

import UIKit
import Foundation

class OnboardingView: UIViewController {
    
    let hPadding = CGFloat(24)
    
    //MARK: - Background
    lazy var ellipse: UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        uiImageView.image = .ellipse1226
        uiImageView.contentMode = .scaleAspectFit
        return uiImageView
    }()
    
    //MARK: - Logo
    lazy var logoHstack: UIStackView = {
        let uiStackView = UIStackView()
        uiStackView.axis = .horizontal
        uiStackView.spacing = 6
        uiStackView.translatesAutoresizingMaskIntoConstraints = false
        uiStackView.addArrangedSubview(logoIcon)
        uiStackView.addArrangedSubview(logoText)
        return uiStackView
    }()
    
    lazy var logoIcon: UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        uiImageView.image = .logo
        uiImageView.contentMode = .scaleAspectFit
        uiImageView.tintColor = .white
        return uiImageView
    }()
    
    lazy var logoText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chatbox"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    //MARK: - Title
    lazy var titleTextFirst: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 68, weight: .regular)
        label.textColor = .white
        label.text = "Connect\nfriends"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var titleTextSecond: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 68, weight: .bold)
        label.textColor = .white
        label.text = "easily &\nquickly"
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Subtitle
    lazy var subtitleText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 26
        paragraphStyle.maximumLineHeight = 26
        let attributedText = NSAttributedString(
            string: "Our chat app is the perfect way to stay connected with friends and family.",
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: UIFont.systemFont(ofSize: 16, weight: .medium)
            ]
        )
        label.attributedText = attributedText
        
        return label
    }()
    
    //MARK: - Buttons
    var socialsView = SocialsView()
    var divider = DividerOR()
    var signUpBtn = Button(text: "Sign up with mail")
    var loginBtn = Subbutton(label: "Existing account? ", accentLabel: "Log in")

    
    override func viewDidLoad() {
        view.addSubview(ellipse)
        
        view.addSubview(logoHstack)
        
        view.addSubview(titleTextFirst)
        view.addSubview(titleTextSecond)
        view.addSubview(subtitleText)
        
        view.addSubview(socialsView)
        
        view.addSubview(divider)
        
        view.addSubview(signUpBtn)
        view.addSubview(loginBtn)
        
        setupNavigation()
        setupConstraints()
    }
    
    private func setupNavigation(){
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupConstraints() {
        guard let image = ellipse.image else {
            return
        }
        
        let ratio = image.size.height / image.size.width
        
        NSLayoutConstraint.activate([
            ellipse.topAnchor.constraint(equalTo: view.topAnchor),
            ellipse.rightAnchor.constraint(equalTo: view.rightAnchor),
            ellipse.widthAnchor.constraint(equalTo: view.widthAnchor),
            ellipse.heightAnchor.constraint(equalTo: ellipse.widthAnchor, multiplier: ratio),
            
            logoHstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17),
            logoHstack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleTextFirst.topAnchor.constraint(equalTo: logoHstack.bottomAnchor, constant: 40),
            titleTextFirst.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: hPadding),
            titleTextFirst.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -hPadding),
            titleTextSecond.topAnchor.constraint(equalTo: titleTextFirst.bottomAnchor),
            titleTextSecond.leadingAnchor.constraint(equalTo: titleTextFirst.leadingAnchor),
            titleTextSecond.trailingAnchor.constraint(equalTo: titleTextFirst.trailingAnchor),
            
            subtitleText.topAnchor.constraint(equalTo: titleTextSecond.bottomAnchor, constant: 16),
            subtitleText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: hPadding),
            subtitleText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hPadding),
            
            socialsView.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: -30),
            socialsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            divider.bottomAnchor.constraint(equalTo: signUpBtn.topAnchor, constant: -50),
            divider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: hPadding),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hPadding),
            
            signUpBtn.bottomAnchor.constraint(equalTo: loginBtn.topAnchor, constant: -40),
            signUpBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: hPadding),
            signUpBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hPadding),
            
            loginBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
