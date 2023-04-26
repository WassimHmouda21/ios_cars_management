//
//  ListcarViewController.swift
//  CarTest
//
//  Created by Mac Mini 11 on 25/4/2023.
//

import UIKit

class ListcarViewController: UITableViewController {

    var cars: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CarCell")
        fetchData()
        
        
    }
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func fetchData() {
        let url = URL(string: "http://127.0.0.1:3000/car/")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    print("JSON object is not a dictionary")
                    return
                }
                print("JSON: \(json)") // Debug print
                
                if let cars = json["cars"] as? [[String: Any]] {
                    self.cars = cars
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }.resume()
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection called")
        return cars.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
        let car = cars[indexPath.row]

        if let marque = car["marque"] as? String, let miseEnCirculation = car["miseEnCirculation"] as? String, let kilometrage = car["kilometrage"] as? String {
            cell.textLabel?.text = "\(marque) \(miseEnCirculation) \(kilometrage)"
        } else {
            cell.textLabel?.text = "Unknown Car"
        }

        return cell
    }


}
