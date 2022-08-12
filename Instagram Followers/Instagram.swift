//
//  Instagram.swift
//  Instagram Followers
//
//  Created by Karl Cridland on 11/08/2022.
//

import Foundation
import UIKit

class Instagram{
    
    public static let shared: Instagram = Instagram()
    
    private init(){
        
    }
    
    func authURL() -> String{
        let appId = 568261224980032
        let redirectUri = "https://instagram.withyour.coffee/auth.html"
        return authURL(appId, redirectUri)
    }
    
    private func authURL(_ appId: Int, _ redirectUri: String) -> String{
        return "https://api.instagram.com/oauth/authorize?client_id=\(appId)&redirect_uri=\(redirectUri)&scope=user_profile,user_media&response_type=code"
    }
    
    func getFollowers() -> [String]{
        return []
    }
    
    func getFollowing() -> [String]{
        return []
    }
    
    func promptSignIn(){
        
    }
    
    func signIn(){
        if let main = ViewController.main{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "IGViewController")
            main.present(newViewController, animated: true, completion: nil)
        }
    }
    
    func signOut(){
        
    }
    
}
