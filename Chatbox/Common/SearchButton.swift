//
//  SearchButton.swift
//  Chatbox
//
//  Created by admin on 14.05.2026.
//

import UIKit

class SearchButton: UIButton {
    
    private let size = CGFloat(44)
    var action: (() -> Void)?
    
    lazy var uiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .search
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(){
        super.init(frame: .zero)
        self.addAction(UIAction(handler: {[weak self] _ in self?.action?() }), for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = size / 2
        
        self.addAction(UIAction(handler: {[weak self] _ in self?.action?() }), for: .touchUpInside)
        self.addSubview(uiImageView)
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: size),
            self.widthAnchor.constraint(equalToConstant: size),
            
            uiImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            uiImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
