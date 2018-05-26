//
//  LogInViewController.swift
//  Projet_transverse
//
//  Created by Jérôme COFFIN on 01/02/2018.
//  Copyright © 2018 Jérôme COFFIN. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Variables
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    //let login_URL = ""
    //let checkSession_URL = ""
    var login_session:String = ""
    let session_exists = UserDefaults.standard
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userName.delegate = self
        self.password.delegate = self
        
        // Check if the session exists
        if session_exists.object(forKey: "session") != nil {
            
            login_session = session_exists.object(forKey: "session") as! String
            
            //check_session()
        }
        //else
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Hide Keyboard
    // Hide keyboard when user tap outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Hide the keyboard when presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}
