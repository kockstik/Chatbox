//
//  HomeView.swift
//  Chatbox
//
//  Created by admin on 13.05.2026.
//

import UIKit

class HomeView: UIViewController, IHomeView {
    
    var presenter: IHomePresenter?
    let hPadding = CGFloat(24)
    
    private var chatsTopConstraint: NSLayoutConstraint!
    var topHeight: CGFloat {
        get {
            return stories.frame.maxY - topBar.frame.maxY + 30
        }
    }
    
    var topBar = TopBarView(title: "Home")
    var stories = StoriesView()
    var chats = ChatsTableView()
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .black
        
        chats.delegate = self
        
        view.addSubview(topBar)
        view.addSubview(stories)
        view.addSubview(chats)
        
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        chatsTopConstraint.constant = topHeight
    }
    
    private func setupConstraints() {
        chatsTopConstraint = chats.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: topHeight)
        NSLayoutConstraint.activate([
            topBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17),
            topBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: hPadding),
            topBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -hPadding),
            
            stories.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: 40),
            stories.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stories.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            chatsTopConstraint,
            chats.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chats.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chats.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension HomeView: IChatsScrollDelegate{
    func chatsDidScroll(_ scrollView: UIScrollView) {
        let scroll = scrollView.contentOffset.y
        let top = max(0, 200 - scroll) / 200
        self.chats.layer.cornerRadius = chats.cornerRadius * top
        self.stories.alpha = 1 * top
        self.chatsTopConstraint.constant = (self.topHeight - 20) * top + 20
        
        self.view.layoutIfNeeded()
    }
}

protocol IHomeView: AnyObject {
    var presenter: IHomePresenter? { get set }
}
