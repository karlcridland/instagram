//
//  SettingsView.swift
//  Instagram Followers
//
//  Created by Karl Cridland on 12/08/2022.
//

import Foundation
import UIKit

class SettingsView: ContainerView{
    
    let buttons = [
        "test" : MenuButton()
    ]
    
    override init(height: CGFloat) {
        super .init(height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuButton: UIButton{
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
