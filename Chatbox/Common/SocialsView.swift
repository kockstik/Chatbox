//
//  SocialsView.swift
//  Chatbox
//
//  Created by admin on 11.05.2026.
//

import UIKit

class SocialsView: UIStackView{
    
    lazy var facebook: SocialButton = {
        let btn = SocialButton(icon: .facebook)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var google: SocialButton = {
        let btn = SocialButton(icon: .google)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var apple: SocialButton = {
        let btn = SocialButton(icon: .apple)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var divider = DividerOR()
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.spacing = 20
        
        self.addArrangedSubview(facebook)
        self.addArrangedSubview(google)
        self.addArrangedSubview(apple)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
