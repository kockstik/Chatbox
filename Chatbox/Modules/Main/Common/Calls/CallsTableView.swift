//
//  CallsTableView.swift
//  Chatbox
//
//  Created by admin on 15.05.2026.
//

import UIKit

class CallsTableView: UIView, UITableViewDelegate {
    
    let cornerRadius = CGFloat(40)
    let identifier = "CallsCells"
    
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
        tabView.register(CallCellView.self, forCellReuseIdentifier: identifier)
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
    
    var items: [CallDTO] = [
        CallDTO(image: .adil, name: "Jhon Abraham", date: Date.now, type: .incoming),
        CallDTO(image: .angel, name: "Sabila Sayma", date: Date.now, type: .missed),
        CallDTO(image: .dean, name: "Alex Linderson", date: Date.now, type: .outgoing),
        CallDTO(image: .adil, name: "Jhon Abraham", date: Date.now, type: .incoming),
        CallDTO(image: .angel, name: "Sabila Sayma", date: Date.now, type: .missed),
        CallDTO(image: .dean, name: "Alex Linderson", date: Date.now, type: .outgoing),
        CallDTO(image: .adil, name: "Jhon Abraham", date: Date.now, type: .incoming),
        CallDTO(image: .angel, name: "Sabila Sayma", date: Date.now, type: .missed),
        CallDTO(image: .dean, name: "Alex Linderson", date: Date.now, type: .outgoing),
        CallDTO(image: .adil, name: "Jhon Abraham", date: Date.now, type: .incoming),
        CallDTO(image: .angel, name: "Sabila Sayma", date: Date.now, type: .missed),
        CallDTO(image: .dean, name: "Alex Linderson", date: Date.now, type: .outgoing),
        CallDTO(image: .adil, name: "Jhon Abraham", date: Date.now, type: .incoming),
        CallDTO(image: .angel, name: "Sabila Sayma", date: Date.now, type: .missed),
        CallDTO(image: .dean, name: "Alex Linderson", date: Date.now, type: .outgoing),
    ]
}

extension CallsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CallCellView else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.configure(with: items[indexPath.row])
        return cell
    }
}
