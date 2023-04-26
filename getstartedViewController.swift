//
//  getstartedViewController.swift
//  CarTest
//
//  Created by Mac Mini 11 on 16/4/2023.
//

import UIKit
import SwiftUI

class getstartedViewController: UIViewController {
    
    @IBOutlet weak var SignInButton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureUI0()
        
        
    }
    
    func configureUI0() {
    SignInButton.layer.cornerRadius = 10
    
    SignInButton.layer.borderWidth = 1
    SignInButton.layer.borderColor = UIColor.systemGray2.cgColor
}
    
    
    @IBAction func SignInButtonPressed(_ sender: Any) {
        
        print ("Login button was pressed")
    }
    
    
    
}
