//
//  SignupView.swift
//  Chatbox
//
//  Created by admin on 13.05.2026.
//

import UIKit

class SignupView: UIViewController, ISignupView {
    
    var presenter: ISignupPresenter?
    
    override func viewDidLoad() {
        
    }
}

protocol ISignupView: AnyObject {
    
}
