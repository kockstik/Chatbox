//
//  StoriesView.swift
//  Chatbox
//
//  Created by admin on 14.05.2026.
//

import UIKit

class StoriesView: UIScrollView {
    
    // Here should integrate Core Data with FRC
    // But I create only UI
    
    private let height: CGFloat = 82
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 24)
        return stackView
    }()
    
    var myStatus = MyStatus()
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.alwaysBounceVertical = false
        self.alwaysBounceHorizontal = true

        
        self.addSubview(myStatus)
        self.addSubview(stackView)
        
        addStories()
        setupConstraints()
    }
    
    private func addStories() {
        stackView.addArrangedSubview(Story(avatar: Avatar(img: .adil), name: "Adil"))
        stackView.addArrangedSubview(Story(avatar: Avatar(img: .marina), name: "Marina", color: .systemPink))
        stackView.addArrangedSubview(Story(avatar: Avatar(img: .dean), name: "Dean", color: .systemBlue))
        stackView.addArrangedSubview(Story(avatar: Avatar(img: .max), name: "Max", color: .systemBrown))
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: height),
            
            myStatus.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            myStatus.topAnchor.constraint(equalTo: self.topAnchor),
            myStatus.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: myStatus.trailingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: self.frameLayoutGuide.heightAnchor),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
