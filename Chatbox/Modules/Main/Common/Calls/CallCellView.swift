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
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupInfoText()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        addSubview(avatar)
        addSubview(nameLabel)
        addSubview(infoLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: hPadding),
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            avatar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 9),
            
            infoLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            infoLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
        ])
    }
    
    func configure(with call: CallDTO){
        avatar.image = call.image
        nameLabel.text = call.name
        infoLabel.text = call.date.formattedDate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
