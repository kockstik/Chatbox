//
//  UIViewController+DismissKeyboard.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

import UIKit

extension UIViewController {
    func setupDismissKeyboardOnTap() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
