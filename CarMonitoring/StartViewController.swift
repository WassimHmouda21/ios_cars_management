//
//  StartViewController.swift
//  CarTest
//
//  Created by Mac Mini 11 on 12/4/2023.
//

import UIKit


class StartViewController: UIViewController {

   
    
    
    @IBOutlet weak var numeroSerieTextField: UITextField!
    
    @IBOutlet weak var marqueTextField: UITextField!
    
 
    @IBOutlet weak var kilometrageTextField: UITextField!
    
    @IBOutlet weak var miseEnCirculationTextField: UITextField!
    
    @IBAction func SaveCarButtonTapped(_ sender: Any) {
    
        guard  let numeroSerie = numeroSerieTextField.text,
               let marque = marqueTextField.text ,
               let miseEnCirculation = miseEnCirculationTextField.text ,
               let kilometrage = kilometrageTextField.text
          
           else {
                return
        }
        
        let addData = ["numeroSerie": numeroSerie, "marque": marque , "miseEnCirculation": miseEnCirculation, "kilometrage": kilometrage]
            let jsonData = try? JSONSerialization.data(withJSONObject: addData)
            
            guard let url = URL(string: "http://127.0.0.1:3000/car") else {
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
                    print("adding Car failed with error code: \(httpResponse.statusCode)")
                    return
                }
            }
            task.resume()
    }
    
    
    

    @IBAction func DisplayCarButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "Segue", sender: self)
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
