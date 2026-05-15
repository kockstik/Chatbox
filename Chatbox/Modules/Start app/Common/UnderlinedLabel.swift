//
//  UnderlinedLabel.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

import UIKit

class UnderlinedLabel: UIView{
    
    lazy var hStack: UIStackView = {
        let uiStackView = UIStackView()
        uiStackView.axis = .horizontal
        uiStackView.translatesAutoresizingMaskIntoConstraints = false
        uiStackView.alignment = .center
        return uiStackView
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .lightAccent
        line.heightAnchor.constraint(equalToConstant: 8).isActive = true
        return line
    }()
    
    var label: UILabel
    
    init(underlinedLabel: UILabel, label: UILabel? = nil, inverQueue: Bool = false){
        self.label = underlinedLabel
        underlinedLabel.translatesAutoresizingMaskIntoConstraints = false
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(line)
        self.addSubview(hStack)
        
        if inverQueue {
            if let label = label {
                hStack.addArrangedSubview(label)
            }
            hStack.addArrangedSubview(underlinedLabel)
        } else {
            hStack.addArrangedSubview(underlinedLabel)
            if let label = label {
                hStack.addArrangedSubview(label)
            }
        }
        
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hStack.topAnchor.constraint(equalTo: self.topAnchor),
            hStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            line.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 1),
            line.leadingAnchor.constraint(equalTo: underlinedLabel.leadingAnchor, constant: -1),
            line.trailingAnchor.constraint(equalTo: underlinedLabel.trailingAnchor, constant: 1),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
