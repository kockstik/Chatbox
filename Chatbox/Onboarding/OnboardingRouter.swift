//
//  OnboardingRouter.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

import UIKit

class OnboardingRouter: IOnboardingRouter {
    weak var presenter: IOnboardingPresenter?
    
    private init(presenter: IOnboardingPresenter? = nil){
        self.presenter = presenter
    }
    
    func login() {
        let loginView = LoginRouter.build()
        if let view = presenter?.view as? UIViewController {
            view.navigationController?.pushViewController(loginView, animated: true)
        }
    }
    
    func signup() {
        
    }
    
    static func build() -> UIViewController {
        let view = OnboardingView()
        let presenter = OnboardingPresenter(view: view)
        let router = OnboardingRouter(presenter: presenter)
        
        view.presenter = presenter
        presenter.router = router
        
        return view
    }
}

protocol IOnboardingRouter: AnyObject {
    var presenter: IOnboardingPresenter? { get set }
    func login()
    func signup()
}
