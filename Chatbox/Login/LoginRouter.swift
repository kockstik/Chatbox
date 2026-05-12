//
//  LoginRouter.swift
//  Chatbox
//
//  Created by admin on 12.05.2026.
//

class LoginRouter: ILoginRouter {
    static var shared = LoginRouter()
    
    weak var presenter: ILoginPresenter?
    
    private init(presenter: ILoginPresenter? = nil) {
        
    }
    
    static func build() -> ILoginView {
        let view = LoginView()
        let presenter = LoginPresenter(view: view)
        let router = LoginRouter(presenter: presenter)
        
        view.presenter = presenter
        presenter.router = router
        
        return view
    }
}

protocol ILoginRouter: AnyObject {
    var presenter: ILoginPresenter? { get set }
}
