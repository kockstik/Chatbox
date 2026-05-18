//
//  CallCellView.swift
//  Chatbox
//
//  Created by admin on 15.05.2026.
//

import UIKit

class CallCellView: UITableViewCell {
    
    private let hPadding = CGFloat(24)
    
    var avatar = Avatar()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupMediumTitle()
        return label
    }()
    
    lazy var infoHStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [infoImage, infoLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 6
        return stackView
    }()
    
    lazy var infoImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 16).isActive = true
        view.widthAnchor.constraint(equalToConstant: 16).isActive = true
        return view
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupInfoText()
        return label
    }()
    
    lazy var btnsStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [callBtn, videoBtn])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    lazy var callBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(.call, for: .normal)
        btn.imageView?.tintColor = .systemGray
        return btn
    }()
    
    lazy var videoBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(.video, for: .normal)
        btn.imageView?.tintColor = .systemGray
        return btn
    }()
    
    lazy var div: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.opacity = 0.15
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        addSubview(avatar)
        addSubview(nameLabel)
        addSubview(infoHStack)
        addSubview(btnsStack)
        addSubview(div)
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: hPadding),
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            avatar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            avatar.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 6),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: btnsStack.leadingAnchor, constant: -12),
            
            infoHStack.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            infoHStack.bottomAnchor.constraint(equalTo: avatar.bottomAnchor, constant: -6),
            infoHStack.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            infoHStack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            
            btnsStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            btnsStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -hPadding),
            
            div.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            div.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            div.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            div.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    func configure(with call: CallDTO){
        avatar.image = call.image
        nameLabel.text = call.name
        infoLabel.text = call.date.formattedDate
        infoImage.image = call.type.image
        infoImage.tintColor = call.type.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
