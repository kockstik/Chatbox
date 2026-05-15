//
//  SocialButton.swift
//  Chatbox
//
//  Created by admin on 11.05.2026.
//

import UIKit

class SocialButton: UIButton{
    
    let size = CGFloat(48)
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(icon: UIImage, isDark: Bool = false){
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = size / 2
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        
        if isDark {
            self.layer.borderColor = UIColor.black.cgColor
        }
        
        image.image = icon
        
        self.addSubview(image)
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: size),
            self.widthAnchor.constraint(equalToConstant: size),
            
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
