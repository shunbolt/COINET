//
//  QuizzViewController.swift
//  Projet_transverse
//
//  Created by Jérôme COFFIN on 06/05/2018.
//  Copyright © 2018 Jérôme COFFIN. All rights reserved.
//

import UIKit
import WebKit

class QuizzViewController: UIViewController, WKUIDelegate {
    
    // MARK: - Variable
    
    var webView: WKWebView!
    
    // Slide Menu
    @IBOutlet weak var slideMenuLeading: NSLayoutConstraint!
    @IBOutlet weak var slideMenu: UIView!
    var isMenuShow = false
    
    // Main View
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainViewLeading: NSLayoutConstraint!
    

    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Hide the slide menu
        slideMenuLeading.constant = -150
        mainViewLeading.constant = -10
        
        
        // Manage slide menu shadow
        slideMenu.layer.shadowOpacity = 1
        slideMenu.layer.shadowRadius = 6
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
    

    
    // MARK: - Hide keyboard
    // Hide keyboard when user tap outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Hide the keyboard when presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Slide Left Menu
    @IBAction func slidingMenu(_ sender: UIBarButtonItem) {
        
        // Slide the menu
        if (isMenuShow){
            
            // Slide the menu to left (size of the view + shadow)
            slideMenuLeading.constant = -150
            
            // Set the main view on full screen
            mainViewLeading.constant = -10
            
            // Add animation
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            
        }
            
        else {
            
            // Put the left of the slide view at zero
            slideMenuLeading.constant = 0
            
            // Move the main view 140 to the right
            mainViewLeading.constant = 140
            
            // Add animation
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            
        }
        
        // Invert : become false if true or true if false
        isMenuShow = !isMenuShow
        
    }
}
