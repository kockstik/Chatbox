//
//  LoginView.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

import UIKit

class LoginView: UIViewController, ILoginView {
    
    var presenter: ILoginPresenter?
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
}

protocol ILoginView: AnyObject {
    var presenter: ILoginPresenter? { get set }
}
