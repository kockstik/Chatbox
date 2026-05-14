//
//  HomeView.swift
//  Chatbox
//
//  Created by admin on 13.05.2026.
//

import UIKit

class HomeView: UIViewController, IHomeView {
    
    var presenter: IHomePresenter?
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
}

protocol IHomeView: AnyObject {
    var presenter: IHomePresenter? { get set }
}
