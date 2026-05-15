//
//  SocialsView.swift
//  Chatbox
//
//  Created by admin on 11.05.2026.
//

import UIKit

class SocialsView: UIStackView{
    
    var isDark: Bool = false
    
    lazy var facebook: SocialButton = {
        let btn = SocialButton(icon: .facebook, isDark: isDark)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var google: SocialButton = {
        let btn = SocialButton(icon: .google, isDark: isDark)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var apple: SocialButton = {
        let btn = SocialButton(icon: .apple, isDark: isDark)
        btn.translatesAutoresizingMaskIntoConstraints = false
        if isDark {
            btn.image.tintColor = .black
        } else {
            btn.image.tintColor = .white
        }
        return btn
    }()
    
    var divider = DividerOR()
    
    init(isDark: Bool = false){
        self.isDark = isDark
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
