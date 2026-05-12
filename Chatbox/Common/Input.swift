//
//  Input.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

import UIKit

class Input: UIView {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .accent
        label.isUserInteractionEnabled = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField.isUserInteractionEnabled = true
        return textField
    }()
    
    lazy var underLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }()
    
    init(name: String) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = name
        
        self.addSubview(nameLabel)
        self.addSubview(textField)
        self.addSubview(underLine)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            textField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            underLine.topAnchor.constraint(equalTo: textField.bottomAnchor),
            underLine.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            underLine.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            underLine.heightAnchor.constraint(equalToConstant: 1),
            underLine.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
