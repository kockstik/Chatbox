//
//  MyStatus.swift
//  Chatbox
//
//  Created by admin on 14.05.2026.
//

import UIKit

class MyStatus: UIButton {
    
    var action: (() -> Void)?
    private var circleSize: CGFloat {
        get {
            return CGFloat(avatar.size + 6)
        }
    }
    
    lazy var segmentedCircle: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = .segmentedCircle
        view.heightAnchor.constraint(equalToConstant: circleSize).isActive = true
        view.widthAnchor.constraint(equalToConstant: circleSize).isActive = true
        
        return view
    }()
    
    var avatar = Avatar(img: .me)
    
    private let sizePlus = CGFloat(16)
    lazy var plus: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = sizePlus / 2
        view.heightAnchor.constraint(equalToConstant: sizePlus).isActive = true
        view.widthAnchor.constraint(equalToConstant: sizePlus).isActive = true
        
        let uiImage = UIImageView()
        uiImage.image = .plus
        uiImage.tintColor = .darkGray
        uiImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(uiImage)
        uiImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        uiImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }()
    
    lazy var text: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "My status"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addAction(UIAction(handler: {[weak self] _ in self?.action?() }), for: .touchUpInside)
        
        self.addSubview(segmentedCircle)
        self.addSubview(avatar)
        self.addSubview(plus)
        self.addSubview(text)
        
        NSLayoutConstraint.activate([
            segmentedCircle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            segmentedCircle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            segmentedCircle.topAnchor.constraint(equalTo: self.topAnchor),
            
            avatar.centerXAnchor.constraint(equalTo: segmentedCircle.centerXAnchor),
            avatar.centerYAnchor.constraint(equalTo: segmentedCircle.centerYAnchor),
            
            plus.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            plus.bottomAnchor.constraint(equalTo: segmentedCircle.bottomAnchor),
            
            text.topAnchor.constraint(equalTo: segmentedCircle.bottomAnchor, constant: 10),
            text.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            text.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            text.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
