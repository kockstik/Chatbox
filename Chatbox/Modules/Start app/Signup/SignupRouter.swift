//
//  SignupRouter.swift
//  Chatbox
//
//  Created by admin on 13.05.2026.
//

import UIKit

class SignupRouter: ISignupRouter {
    weak var presenter: ISignupPresenter?
    
    init(presenter: ISignupPresenter?){
        self.presenter = presenter
    }
    
    static func build() -> UIViewController{
        let view = SignupView()
        let presenter = SignupPresenter(view: view)
        let router = SignupRouter(presenter: presenter)
        
        view.presenter = presenter
        presenter.router = router
        
        return view
    }
}

protocol ISignupRouter: AnyObject {
    var presenter: ISignupPresenter? { get set }
}
