//
//  OnboardingPresenter.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

class OnboardingPresenter: IOnboardingPresenter {
    weak var view: IOnboardingView?
    var router: IOnboardingRouter?
    
    init(view: IOnboardingView) {
        self.view = view
    }
    
    func didSignUpTap() {
        router?.signup()
    }
    
    func didLogInTap() {
        router?.login()
    }
}

protocol IOnboardingPresenter: AnyObject {
    var view: IOnboardingView? { get set }
    var router: IOnboardingRouter? { get set }
    
    func didSignUpTap()
    func didLogInTap()
}
