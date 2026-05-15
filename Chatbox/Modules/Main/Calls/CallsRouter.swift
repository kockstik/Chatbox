//
//  CallsRouter.swift
//  Chatbox
//
//  Created by admin on 15.05.2026.
//

import UIKit

class CallsRouter: ICallsRouter {
    
    weak var presenter: ICallsPresenter?
    
    init(presenter: ICallsPresenter){
        self.presenter = presenter
    }
    
    static func build() -> UIViewController {
        let view = CallsView()
        let presenter = CallsPresenter(view: view)
        let router = CallsRouter(presenter: presenter)
        
        view.presenter = presenter
        presenter.router = router
        
        return view
    }
}

protocol ICallsRouter: AnyObject{
    var presenter: ICallsPresenter? { get set }
}
