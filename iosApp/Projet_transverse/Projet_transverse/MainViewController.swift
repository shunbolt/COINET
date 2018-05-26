//
//  MainViewController.swift
//  Projet_transverse
//
//  Created by Jérôme COFFIN on 01/02/2018.
//  Copyright © 2018 Jérôme COFFIN. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    // MARK: - Variable
    
    var cryptoApiArrayUSD = [String]()
    var cryptoNameArray = [String]()
    
    let gradientLayer = CAGradientLayer()
    
    // Slide Menu
    @IBOutlet weak var slideMenuLeading: NSLayoutConstraint!
    @IBOutlet weak var slideMenu: UIView!
    var isMenuShow = false
    
    // Main View
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainViewLeading: NSLayoutConstraint!
    
    // CollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var leadingCollectionView: NSLayoutConstraint!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Hide the slide menu
        slideMenuLeading.constant = -150
        mainViewLeading.constant = -10
        leadingCollectionView.constant = 10
        
        
        // Manage slide menu shadow
        slideMenu.layer.shadowOpacity = 1
        slideMenu.layer.shadowRadius = 6
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fillArrayAPI()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            leadingCollectionView.constant = 10
            
            // Add animation
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            
        }
            
        else {
            
            // Put the left of the slide view at zero
            slideMenuLeading.constant = 0
            
            // Move the main view 140 to the right
            mainViewLeading.constant = 140
            leadingCollectionView.constant = 0
            
            // Add animation
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            
        }
        
        // Invert : become false if true or true if false
        isMenuShow = !isMenuShow
        
    }
    
    // MARK: - Unwind
    @IBAction func unwindToMainViewController(segue: UIStoryboardSegue){
    }
    
    // MARK: - Introduce the API
    // The CryptoCompare API URL here returns the value of 1 in USD
    
    func fillArrayAPI(){
        
        cryptoApiArrayUSD.append("https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD")
        cryptoNameArray.append("ETHERUM")
        cryptoApiArrayUSD.append("https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD")
        cryptoNameArray.append("BITCOIN")
        cryptoApiArrayUSD.append("https://min-api.cryptocompare.com/data/price?fsym=LTC&tsyms=USD")
        cryptoNameArray.append("LITECOIN")
        cryptoApiArrayUSD.append("https://min-api.cryptocompare.com/data/price?fsym=XRP&tsyms=USD")
        cryptoNameArray.append("RIPPLE")
        cryptoApiArrayUSD.append("https://min-api.cryptocompare.com/data/price?fsym=BCH&tsyms=USD")
        cryptoNameArray.append("BITCOIN CASH")
        cryptoApiArrayUSD.append("https://min-api.cryptocompare.com/data/price?fsym=EOS&tsyms=USD")
        cryptoNameArray.append("EOS")
    }
    
    
    // MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cryptoApiArrayUSD.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let mainCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! CoinCollectionViewCell
      
        mainCell.apiURL  = URL(string :cryptoApiArrayUSD[indexPath.row])
        mainCell.displayCurName.text = cryptoNameArray[indexPath.row]
        
        mainCell.logoImage.image = UIImage(named: mainCell.displayCurName.text!)
        
        mainCell.layer.shadowColor = UIColor.black.cgColor
        mainCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        mainCell.layer.shadowRadius = 2.0
        mainCell.layer.shadowOpacity = 0.5
        mainCell.layer.masksToBounds = false
        mainCell.layer.shadowPath = UIBezierPath(roundedRect: mainCell.bounds, cornerRadius: mainCell.contentView.layer.cornerRadius).cgPath
        
        return mainCell
    }
    
}
