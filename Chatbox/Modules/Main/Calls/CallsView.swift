//
//  CallsView.swift
//  Chatbox
//
//  Created by admin on 13.05.2026.
//

import UIKit

class CallsView: UIViewController, ICallsView {
    
    var presenter: ICallsPresenter?
    let hPadding = CGFloat(24)
    
    var topBar = TopBarView(title: "Calls", rightButton: CircleButton(image: .callAdd))
    
    var calls = CallsTableView()
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .black
        
        view.addSubview(topBar)
        view.addSubview(calls)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17),
            topBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: hPadding),
            topBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -hPadding),
            
            calls.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: 30),
            calls.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calls.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calls.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

protocol ICallsView: AnyObject {
    var presenter: ICallsPresenter? { get set }
}
