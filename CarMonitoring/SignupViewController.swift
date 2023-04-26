//
//  SignupViewController.swift
//  CarTest
//
//  Created by Mac Mini 11 on 12/4/2023.
//

import UIKit

class SignupViewController: UIViewController {

   
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var email2TextField: UITextField!
    
    
    @IBOutlet weak var adressTextField: UITextField!
    
    
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    
    
    @IBOutlet weak var password2TextField: UITextField!
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        guard  let firstName = firstNameTextField.text,
               let lastName = lastNameTextField.text ,
               let emaile = email2TextField.text,
               let adressee = adressTextField.text ,
               let dateOfBirth = dateOfBirthTextField.text,
               let password = password2TextField.text
           else {
                return
        }
        
        let signUpData = ["nom": firstName, "prenom": lastName ,"email": emaile, "adresse": adressee, "dateDeNaissance": dateOfBirth ,"motDePasse": password]
            let jsonData = try? JSONSerialization.data(withJSONObject: signUpData)
            
            guard let url = URL(string: "http://127.0.0.1:3000/user/signup") else {
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
                
                if httpResponse.statusCode == 200 {
                    // Sign up successful
                    DispatchQueue.main.async {
                        // Perform segue to next view controller or update UI as needed
                    }
                } else {
                    // Sign up failed
                    print("Sign up failed with error code: \(httpResponse.statusCode)")
                    return
                }
            }
            task.resume()
        }

        
        
        
            
            
            
            
        
            
            
            
            
        
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
