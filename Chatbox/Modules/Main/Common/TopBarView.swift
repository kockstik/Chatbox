//
//  TopBarView.swift
//  Chatbox
//
//  Created by admin on 14.05.2026.
//

import UIKit

class TopBarView: UIView {
    
    var delegate: TopBarSearchDelegate?
    var searchButton = CircleButton(image: .search)
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupMediumTitle(color: .white)
        return label
    }()
    
    var rightButton: UIView
    
    init(title: String, rightButton: UIView) {
        self.rightButton = rightButton
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(searchButton)
        searchButton.action = { [weak self] in
            self?.delegate?.searchButtonTapped()
        }
        self.addSubview(label)
        self.addSubview(rightButton)
        
        label.text = title
        
        setupConstraints()
    }
    
    convenience init(title: String){
        self.init(title: title, rightButton: Avatar(img: .me, size: 44))
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            searchButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            rightButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rightButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            rightButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol TopBarSearchDelegate {
    func searchButtonTapped()
    func searchTextDidChange(_ text: String)
}
