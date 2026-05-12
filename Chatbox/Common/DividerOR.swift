//
//  DividerOR.swift
//  Chatbox
//
//  Created by admin on 11.05.2026.
//

import UIKit

class DividerOR: UIView {
    lazy var hStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 15
        stack.alignment = .center
        
        stack.addArrangedSubview(leftStick)
        stack.addArrangedSubview(labelDivider)
        stack.addArrangedSubview(rightStick)
        return stack
    }()
    
    lazy var labelDivider: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "OR"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    fileprivate var leftStick = StickDivider()
    fileprivate var rightStick = StickDivider()
    
    init(isDark: Bool = false) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hStack)
        
        if isDark {
            leftStick.stick.backgroundColor = .lightGray
            rightStick.stick.backgroundColor = .lightGray
            labelDivider.textColor = .systemGray
        }
        
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            labelDivider.centerXAnchor.constraint(equalTo: hStack.centerXAnchor),
            
            leftStick.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            leftStick.centerYAnchor.constraint(equalTo: labelDivider.centerYAnchor),
            rightStick.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),
            rightStick.centerYAnchor.constraint(equalTo: labelDivider.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate class StickDivider: UIView {
    lazy var stick: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .systemGray4
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stick)
        
        NSLayoutConstraint.activate([
            stick.heightAnchor.constraint(equalToConstant: 1),
            stick.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stick.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
