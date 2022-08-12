//
//  SettingsView.swift
//  Instagram Followers
//
//  Created by Karl Cridland on 12/08/2022.
//

import Foundation
import UIKit

class SettingsView: ContainerView{
    
    override init(height: CGFloat) {
        super .init(height: height)
        self.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

