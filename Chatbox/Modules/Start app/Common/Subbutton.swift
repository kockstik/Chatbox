//
//  Subbutton.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

import UIKit

class Subbutton: UIButton {
    
    var action: (() -> Void)?
    
    lazy var loginLabelsHstack: UIStackView = {
        let uiStackView = UIStackView()
        uiStackView.axis = .horizontal
        uiStackView.translatesAutoresizingMaskIntoConstraints = false
        uiStackView.addArrangedSubview(leftPartLoginLabel)
        uiStackView.addArrangedSubview(rightPartLoginLabel)
        uiStackView.alignment = .center
        return uiStackView
    }()
    
    lazy var leftPartLoginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var rightPartLoginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    init(label: String, accentLabel: String = ""){
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginLabelsHstack)
        self.addAction(UIAction(handler: {[weak self] _ in self?.action?() }), for: .touchUpInside)
        leftPartLoginLabel.text = label
        rightPartLoginLabel.text = accentLabel
        
        if accentLabel.isEmpty {
            leftPartLoginLabel.textColor = .accent
            leftPartLoginLabel.font = .systemFont(ofSize: 14, weight: .medium)
        }
        
        self.isUserInteractionEnabled = true
        loginLabelsHstack.isUserInteractionEnabled = false
        
        NSLayoutConstraint.activate([
            loginLabelsHstack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginLabelsHstack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
