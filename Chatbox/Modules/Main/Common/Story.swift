//
//  Story.swift
//  Chatbox
//
//  Created by admin on 14.05.2026.
//

import UIKit

class Story: UIButton {
    
    var action: (() -> Void)?
    
    private let avatar: Avatar
    private var circleSize: CGFloat {
        get {
            return CGFloat(avatar.size + 6)
        }
    }
    
    lazy var circle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.yellow.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = circleSize / 2
        return view
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    init(avatar: Avatar) {
        self.avatar = avatar
        super.init(frame: .zero)
        
        self.addAction(UIAction(handler: {[weak self] _ in self?.action?() }), for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(circle)
        self.addSubview(avatar)
        self.addSubview(name)
        
        NSLayoutConstraint.activate([
            circle.topAnchor.constraint(equalTo: self.topAnchor),
            circle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            circle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            circle.heightAnchor.constraint(equalToConstant: circleSize),
            circle.widthAnchor.constraint(equalToConstant: circleSize),
            
            avatar.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
            avatar.centerYAnchor.constraint(equalTo: circle.centerYAnchor),
            
            name.topAnchor.constraint(equalTo: circle.bottomAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            name.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            name.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    convenience init(avatar: Avatar, color: UIColor){
        self.init(avatar: avatar)
        circle.layer.borderColor = color.cgColor
    }
    
    convenience init(avatar: Avatar, name: String){
        self.init(avatar: avatar)
        self.name.text = name
    }
    
    convenience init(avatar: Avatar, name: String, color: UIColor){
        self.init(avatar: avatar)
        circle.layer.borderColor = color.cgColor
        self.name.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
