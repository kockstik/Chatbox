//
//  UILabel+Extensions.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

import UIKit

extension UILabel {
    func setupSmallTitle(color: UIColor? = .black){
        self.font = .systemFont(ofSize: 18, weight: .bold)
        self.textColor = color
    }
    
    func setLineHeight(height: CGFloat){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = height
        paragraphStyle.maximumLineHeight = height
        let attributedText = NSAttributedString(
            string: self.text ?? "",
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: self.font ?? .systemFont(ofSize: 16, weight: .medium)
            ]
        )
        self.attributedText = attributedText
    }
}
