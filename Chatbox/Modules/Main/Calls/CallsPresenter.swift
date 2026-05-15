//
//  CallsPresenter.swift
//  Chatbox
//
//  Created by admin on 15.05.2026.
//

import UIKit

class CallsPresenter: ICallsPresenter {
    weak var view: ICallsView?
    var router: ICallsRouter?
    
    init(view: ICallsView?) {
        self.view = view
    }
}

protocol ICallsPresenter: AnyObject {
    var view: ICallsView? { get set }
    var router: ICallsRouter? { get set }
}
