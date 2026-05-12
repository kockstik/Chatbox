//
//  Button.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

import UIKit

class Button: UIButton{
    
    let type: TypeButton
    
    var isActive: Bool = false {
        didSet {
            guard isActive != oldValue else { return }
            if isActive {
                makeActive()
            } else {
                makeInactive()
            }
        }
    }
    
    
    var action: (() -> Void)?
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    init(text: String, type: TypeButton = .primary){
        self.type = type
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        self.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.addSubview(label)
        
        self.addAction(UIAction(handler: {[weak self] _ in self?.action?() }), for: .touchUpInside)
        
        label.text = text
        
        self.backgroundColor = type.backgroundColor
        label.textColor = type.textColor
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeInactive(){
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.backgroundColor = .inactiveBtn
            self?.label.textColor = .systemGray2
        }
    }
    
    private func makeActive() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.backgroundColor = self?.type.backgroundColor
            self?.label.textColor = self?.type.textColor
        }
    }
}

enum TypeButton {
    case primary
    case secondary
    case accent
    
    var backgroundColor: UIColor {
        switch self {
        case .primary:
            return .white

        case .secondary:
            return .inactiveBtn

        case .accent:
            return .accent
        }
    }

    var textColor: UIColor {
        switch self {
        case .primary:
            return .black

        case .secondary:
            return .accent

        case .accent:
            return .white
        }
    }
}
