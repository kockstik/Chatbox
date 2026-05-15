//
//  Avatar.swift
//  Chatbox
//
//  Created by admin on 14.05.2026.
//

import UIKit

class Avatar: UIImageView {
    
    var size: CGFloat {
        didSet{
            setup(withSize: size)
        }
    }
    
    init(size: Int = 52){
        self.size = CGFloat(size)
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    
        setup(withSize: self.size)
    }
    
    private func setup(withSize size: CGFloat){
        self.layer.cornerRadius = CGFloat(size) / 2
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: CGFloat(size)),
            self.widthAnchor.constraint(equalToConstant: CGFloat(size)),
        ])
    }
    
    convenience init(img: UIImage, size: Int = 52) {
        self.init(size: size)
        self.image = img
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
