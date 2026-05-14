//
//  LoginPresenter.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

class LoginPresenter: ILoginPresenter {
    weak var view: ILoginView?
    var router: ILoginRouter?
    
    init(view: ILoginView) {
        self.view = view
    }
}

protocol ILoginPresenter: AnyObject {
    var view: ILoginView? { get set }
    var router: ILoginRouter? { get }
}
