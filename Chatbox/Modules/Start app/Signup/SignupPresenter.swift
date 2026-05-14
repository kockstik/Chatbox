//
//  SignupPresenter.swift
//  Chatbox
//
//  Created by admin on 13.05.2026.
//

class SignupPresenter: ISignupPresenter {
    
    weak var view: ISignupView?
    var router: ISignupRouter?
    
    init(view: ISignupView?) {
        self.view = view
    }
}

protocol ISignupPresenter: AnyObject {
    var view: ISignupView? { get set }
    var router: ISignupRouter? { get set }
}
