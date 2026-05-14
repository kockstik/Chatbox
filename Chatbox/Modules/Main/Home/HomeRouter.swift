//
//  HomeRouter.swift
//  Chatbox
//
//  Created by admin on 13.05.2026.
//

import UIKit

class HomeRouter: IHomeRouter {
    weak var presenter: IHomePresenter?
    
    init(presenter: IHomePresenter?) {
        self.presenter = presenter
    }
    
    static func build() -> UIViewController {
        let view = HomeView()
        let presenter = HomePresenter(view: view)
        let router = HomeRouter(presenter: presenter)
        
        view.presenter = presenter
        presenter.router = router
        
        return view
    }
}

protocol IHomeRouter: AnyObject {
    var presenter: IHomePresenter? { get set }
}
