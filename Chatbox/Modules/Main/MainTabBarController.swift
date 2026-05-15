//
//  MainTabBarController.swift
//  Chatbox
//
//  Created by admin on 14.05.2026.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customTabBar = CustomTabBar()
        setValue(customTabBar, forKey: "tabBar")
        
        tabBar.layer.borderWidth = 1.0
        tabBar.layer.borderColor = UIColor.stroke.cgColor
        
        setupTabs()
    }
    
    private func setupTabs() {
        let homeView = HomeRouter.build()
        homeView.tabBarItem = UITabBarItem(title: "Message", image: .message, tag: 0)
        homeView.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let callsView = CallsRouter.build()
        callsView.tabBarItem = UITabBarItem(title: "Calls", image: .call, tag: 1)
        callsView.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let contactsView = ContactsView()
        contactsView.tabBarItem = UITabBarItem(title: "Contacts", image: .user, tag: 2)
        contactsView.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let settingsView = SettingsView()
        settingsView.tabBarItem = UITabBarItem(title: "Settings", image: .settings, tag: 3)
        settingsView.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        tabBar.backgroundColor = .white
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.stackedLayoutAppearance.selected.iconColor = .accent
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16, weight: .medium),
            .foregroundColor: UIColor.accent
        ]
        appearance.stackedLayoutAppearance.normal.iconColor = .systemGray2
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.systemGray2
        ]
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
        
        setViewControllers([
            UINavigationController(rootViewController: homeView),
            UINavigationController(rootViewController: callsView),
            UINavigationController(rootViewController: contactsView),
            UINavigationController(rootViewController: settingsView),
        ], animated: true)
    }
}
