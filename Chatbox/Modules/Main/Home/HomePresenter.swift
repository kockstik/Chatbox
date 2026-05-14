//
//  HomePresenter.swift
//  Chatbox
//
//  Created by admin on 13.05.2026.
//

class HomePresenter: IHomePresenter {
    weak var view: IHomeView?
    var router: IHomeRouter?
    
    init(view: IHomeView?) {
        self.view = view
    }
}

protocol IHomePresenter: AnyObject {
    var view: IHomeView? { get set }
    var router: IHomeRouter? { get set }
}
