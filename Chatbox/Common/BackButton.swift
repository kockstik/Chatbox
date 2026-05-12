//
//  BackButton.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

import UIKit

class BackButton: UIButton {
    
    var action: (() -> Void)?
    
    lazy var uiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backArrow
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addAction(UIAction(handler: {[weak self] _ in self?.action?() }), for: .touchUpInside)
        self.addSubview(uiImageView)
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 24),
            self.widthAnchor.constraint(equalToConstant: 24),
            
            uiImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            uiImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
