//
//  UserViewController.swift
//  CarTest
//
//  Created by Mac Mini 11 on 11/4/2023.
//

import UIKit
import SwiftUI



class UserViewController: UIViewController {

   

    @IBOutlet weak var emailTextField: UITextField!
    
      
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        
       
            let username = emailTextField.text!
            let password = passwordTextField.text!

            let url = URL(string: "http://127.0.0.1:3000/user/signin")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"

            let body = "email=\(username)&motDePasse=\(password)"
            request.httpBody = body.data(using: .utf8)

        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error!.localizedDescription)")
                return
            }
            

            if (200...299).contains(httpResponse.statusCode) {
                // Login successful, navigate to the StartViewController
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let destinationVC = storyboard.instantiateViewController(withIdentifier: "StartView") as! StartViewController

                    // Push the destination view controller onto the navigation stack
                    self!.navigationController?.pushViewController(destinationVC, animated: true)
                
                }
            } else {
                // Login failed, display an error message
                DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "Login Error", message: "Incorrect email or password", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self?.present(alertController, animated: true, completion: nil)
                }
            }
        }
         
        
        


        task.resume()


        
        
          
        }
    
   
    
    

    
   
    
  
        var showHideButton: UIButton!

        override func viewDidLoad() {
            super.viewDidLoad()
            
            passwordTextField.isSecureTextEntry = true

            // Create the show/hide password button
            showHideButton = UIButton(type: .custom)
            showHideButton.setImage(UIImage(systemName: "eye"), for: .normal)
            showHideButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

            // Add the button as the rightView of the passwordTextField
            passwordTextField.rightView = showHideButton
            passwordTextField.rightViewMode = .always
        }

        @objc func togglePasswordVisibility(sender: UIButton) {
            passwordTextField.isSecureTextEntry.toggle()
            let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
            
            sender.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }

    

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


