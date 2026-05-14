//
//  CustomTabBar.swift
//  Chatbox
//
//  Created by admin on 14.05.2026.
//

import UIKit

class CustomTabBar: UITabBar {
    
    private let extraHeight = CGFloat(20)
    
    init(){
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = sizeThatFits.height + extraHeight
        return sizeThatFits
    }
}
