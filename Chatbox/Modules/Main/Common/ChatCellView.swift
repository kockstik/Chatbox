//
//  ChatCellView.swift
//  Chatbox
//
//  Created by admin on 14.05.2026.
//

import UIKit

class ChatCellView: UITableViewCell {
    
    private let hPadding = CGFloat(24)
    private let sizeNotification = CGFloat(22)
    
    var avatar = Avatar()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupMediumTitle()
        return label
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupInfoText()
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupInfoText()
        return label
    }()
    
    lazy var notificationLabel: UILabel = {
        let label = UILabel()
        label.setupInfoText(color: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var notification: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = sizeNotification / 2
        
        view.addSubview(notificationLabel)
        notificationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        notificationLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: sizeNotification).isActive = true
        view.widthAnchor.constraint(equalToConstant: sizeNotification).isActive = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        addSubview(avatar)
        addSubview(timeLabel)
        addSubview(nameLabel)
        addSubview(infoLabel)
        addSubview(notification)
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: hPadding),
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            avatar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            
            timeLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -hPadding),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 9),
            
            infoLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            infoLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            notification.centerYAnchor.constraint(equalTo: infoLabel.centerYAnchor),
            notification.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
        ])
    }
    
    func configure(with chat: ChatDTO){
        avatar.image = chat.image
        nameLabel.text = chat.name
        infoLabel.text = chat.lastMessage
        timeLabel.text = chat.date.formattedDate
        notificationLabel.text = "\(chat.unreadCount)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
