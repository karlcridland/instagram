//
//  Navigator.swift
//  Instagram Followers
//
//  Created by Karl Cridland on 12/08/2022.
//

import Foundation
import UIKit

class Navigator: UIView{
    
    public static let shared: Navigator = Navigator()
    
    private let home, profile, settings: NavigatorButton
    private var homeView, profileView, settingsView, currentContainer: ContainerView?
    
    private init(){
        let height = CGFloat(40)
        self.home = NavigatorButton("home", height)
        self.profile = NavigatorButton("profile", height)
        self.settings = NavigatorButton("settings", height)
        super.init(frame: .zero)
        
        let buttons = [self.home, self.profile, self.settings]
        
        let gap = UIScreen.main.bounds.width / CGFloat(buttons.count + 1)
        for (i, button) in buttons.enumerated(){
            self.addSubview(button)
            button.center = CGPoint(x: gap + (CGFloat(i) * gap), y: 60 / 2)
        }
        
        self.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
        
        self.home.addTarget(self, action: #selector(openHome), for: .touchUpInside)
        self.profile.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        self.settings.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        
    }
    
    @objc func openHome(){
        if let superview = self.superview{
            if let homeView = self.homeView {
                self.removeContainer()
                superview.addSubview(homeView)
                self.currentContainer = homeView
            }
            else{
                self.homeView = HomeView(height: superview.frame.height - 60)
                self.openHome()
            }
        }
    }
    
    @objc func openProfile(){
        if let superview = self.superview{
            if let profileView = self.profileView {
                self.removeContainer()
                superview.addSubview(profileView)
                self.currentContainer = profileView
            }
            else{
                self.profileView = ProfileView(height: superview.frame.height - 60)
                self.openProfile()
            }
        }
    }
    
    @objc func openSettings(){
        if let superview = self.superview{
            if let settingsView = self.settingsView {
                self.removeContainer()
                superview.addSubview(settingsView)
                self.currentContainer = settingsView
            }
            else{
                self.settingsView = SettingsView(height: superview.frame.height - 60)
                self.openSettings()
            }
        }
    }
    
    private func removeContainer(){
        if let currentContainer = self.currentContainer {
            currentContainer.removeFromSuperview()
        }
        self.currentContainer = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class NavigatorButton: UIButton{
    
    static var children: [NavigatorButton] = []
    
    let label: UILabel
    let fontSize = CGFloat(11)
    
    init(_ title: String, _ height: CGFloat) {
        self.label = UILabel(frame: CGRect(x: 5, y: height - fontSize - 2, width: 50, height: fontSize + 2))
        super .init(frame: CGRect(x: 0, y: 0, width: 60, height: height))
        
        self.label.text = title
        self.label.font = UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight(rawValue: 0.4))
        self.label.textAlignment = .center
        
        self.addSubview(self.label)
        
        NavigatorButton.children.append(self)
        self.addTarget(self, action: #selector(clicked), for: .touchUpInside)
    }
    
    @objc func clicked(){
        self.setState(.active)
    }
    
    func setState(_ state: NavigatorButtonState){
        switch (state){
        case .active:
            NavigatorButton.children.forEach { button in
                button.setState(.none)
            }
            self.backgroundColor = .white
            break
        case .hover:
            break
        case .none:
            self.backgroundColor = .clear
            break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

enum NavigatorButtonState{
    case active
    case hover
    case none
}
