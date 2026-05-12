//
//  Button.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

import UIKit

class Button: UIButton{
    
    var action: (() -> Void)?
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    init(text: String, type: TypeButton = .primary){
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 48)
        self.addSubview(label)
        
        self.addAction(UIAction(handler: {[weak self] _ in self?.action?() }), for: .touchUpInside)
        
        label.text = text
        
        switch(type){
        case .primary:
            self.backgroundColor = .white
            label.textColor = .black
        case .secondary:
            self.backgroundColor = .white
            label.textColor = .lightGray
        case .accent:
            self.backgroundColor = .accent
            label.textColor = .white
        }
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: self.frame.height),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum TypeButton {
    case primary
    case secondary
    case accent
}
