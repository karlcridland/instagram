//
//  ViewController.swift
//  Instagram Followers
//
//  Created by Karl Cridland on 09/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    static var main: UIViewController?
    var firstVisit = true

    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.main = self
    }
    
    override func viewDidLayoutSubviews() {
        if (firstVisit){
            if let first = self.view.superview, let second = first.superview{
                
                let top = second.layoutMargins.top
                let bottom = second.layoutMargins.bottom
                
                self.view.frame = CGRect(
                    x: 0,
                    y: top,
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height - top - bottom
                )
                
                self.view.backgroundColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1)
                first.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
                
                self.launchScreen()
            }
        }
        self.firstVisit = false
    }
    
    func launchScreen(){
        let navigator = Navigator.shared
        navigator.frame = CGRect(x: 0, y: self.view.frame.height - 60, width: UIScreen.main.bounds.width, height: 60)
        self.view.addSubview(navigator)
        navigator.openHome()
        
        Instagram.shared.signIn()
    }

}

