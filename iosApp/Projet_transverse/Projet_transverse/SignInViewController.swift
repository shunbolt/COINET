//
//  SignInViewController.swift
//  Projet_transverse
//
//  Created by Jérôme COFFIN on 01/02/2018.
//  Copyright © 2018 Jérôme COFFIN. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.email.delegate = self
        self.username.delegate = self
        self.password.delegate = self
        self.confirmPassword.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Hide keyboard when user tap outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
