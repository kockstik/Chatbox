//
//  TopBarView.swift
//  Chatbox
//
//  Created by admin on 14.05.2026.
//

import UIKit

class TopBarView: UIView {
    
    var searchButton = SearchButton()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupMediumTitle(color: .white)
        label.text = "Home"
        return label
    }()
    
    var avatar = Avatar(img: .me, size: 44)
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(searchButton)
        self.addSubview(label)
        self.addSubview(avatar)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            searchButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            avatar.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            avatar.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
