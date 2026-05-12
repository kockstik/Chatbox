//
//  OnboardingRouter.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

class OnboardingRouter: IOnboardingRouter {
    static var shared = OnboardingRouter()
    
    weak var presenter: IOnboardingPresenter?
    
    private init(presenter: IOnboardingPresenter? = nil){
        self.presenter = presenter
    }
    
    func login() {
        
    }
    
    func signup() {
        
    }
    
    static func build() -> OnboardingView {
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
