//
//  MOOCViewController.swift
//  Projet_transverse
//
//  Created by Jérôme COFFIN on 02/05/2018.
//  Copyright © 2018 Jérôme COFFIN. All rights reserved.
//


import UIKit

class MOOCViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // MARK: - Variable
    
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
    
    
    let list = ["Chapter 1", "Chapter 2", "Chapter 3", "Chapter 4"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    
}

