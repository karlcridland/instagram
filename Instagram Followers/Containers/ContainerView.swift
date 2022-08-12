//
//  ContainerView.swift
//  Instagram Followers
//
//  Created by Karl Cridland on 12/08/2022.
//

import Foundation
import UIKit

class ContainerView: UIScrollView{
    
    init(height: CGFloat) {
        super .init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height))
        
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
