//
//  ChatsView.swift
//  Chatbox
//
//  Created by admin on 14.05.2026.
//

import UIKit

class ChatsView: UIView, UITableViewDelegate {
    
    let cornerRadius = CGFloat(40)
    let identifier = "ChatCells"
    var delegate: IChatsScrollDelegate? = nil
    
    lazy var stick: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 3).isActive = true
        view.widthAnchor.constraint(equalToConstant: 30).isActive = true
        view.layer.cornerRadius = 1.5
        view.clipsToBounds = true
        view.layer.opacity = 0.5
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tabView = UITableView()
        tabView.translatesAutoresizingMaskIntoConstraints = false
        tabView.delegate = self
        tabView.dataSource = self
        tabView.register(ChatCellView.self, forCellReuseIdentifier: identifier)
        tabView.backgroundColor = self.backgroundColor
        tabView.rowHeight = UITableView.automaticDimension
        tabView.separatorInset = .zero
        tabView.separatorStyle = .none
        return tabView
    }()
    
    init(){
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.masksToBounds = true
        
        self.addSubview(stick)
        self.addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stick.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            stick.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: stick.bottomAnchor, constant: 9),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var items: [ChatDTO] = [
        ChatDTO(image: .alex, name: "Alex Linderson", lastMessage: "How are you today?", date: Date.now, unreadCount: 3),
        ChatDTO(image: .team, name: "Team Align", lastMessage: "Don’t miss to attend the meeting.", date: Date.now, unreadCount: 4),
        ChatDTO(image: .alex, name: "Alex Linderson", lastMessage: "How are you today?", date: Date.now, unreadCount: 3),
        ChatDTO(image: .team, name: "Team Align", lastMessage: "Don’t miss to attend the meeting.", date: Date.now, unreadCount: 4),
        ChatDTO(image: .alex, name: "Alex Linderson", lastMessage: "How are you today?", date: Date.now, unreadCount: 3),
        ChatDTO(image: .team, name: "Team Align", lastMessage: "Don’t miss to attend the meeting.", date: Date.now, unreadCount: 4),
        ChatDTO(image: .alex, name: "Alex Linderson", lastMessage: "How are you today?", date: Date.now, unreadCount: 3),
        ChatDTO(image: .team, name: "Team Align", lastMessage: "Don’t miss to attend the meeting.", date: Date.now, unreadCount: 4),
        ChatDTO(image: .alex, name: "Alex Linderson", lastMessage: "How are you today?", date: Date.now, unreadCount: 3),
        ChatDTO(image: .team, name: "Team Align", lastMessage: "Don’t miss to attend the meeting.", date: Date.now, unreadCount: 4),
        ChatDTO(image: .alex, name: "Alex Linderson", lastMessage: "How are you today?", date: Date.now, unreadCount: 3),
        ChatDTO(image: .team, name: "Team Align", lastMessage: "Don’t miss to attend the meeting.", date: Date.now, unreadCount: 4),
        ChatDTO(image: .alex, name: "Alex Linderson", lastMessage: "How are you today?", date: Date.now, unreadCount: 3),
        ChatDTO(image: .team, name: "Team Align", lastMessage: "Don’t miss to attend the meeting.", date: Date.now, unreadCount: 4),
    ]
}

extension ChatsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ChatCellView else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: nil) {_,_, completion in
            print("delete")
            completion(true)
        }
        delete.image = .trashCircle
        delete.backgroundColor = .context
        
        let mute = UIContextualAction(style: .normal, title: nil) {_,_, completion in
            print("mute")
            completion(true)
        }
        mute.image = .notificationCircle
        mute.backgroundColor = .context
        
        let config = UISwipeActionsConfiguration(actions: [delete, mute])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }

        UIView.animate(withDuration: 0.2) {
            cell.backgroundColor = .context
        }
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        guard let indexPath, let cell = tableView.cellForRow(at: indexPath) else {
            return
        }

        UIView.animate(withDuration: 0.2) {
            cell.backgroundColor = .white
        }
    }
}

extension ChatsView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.chatsDidScroll(scrollView)
    }
}

protocol IChatsScrollDelegate: AnyObject {
    func chatsDidScroll(_ scrollView: UIScrollView)
}
