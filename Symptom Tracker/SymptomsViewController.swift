//
//  SymptomsViewController.swift
//  Symptom Tracker
//
//  Created by Divya Mereddy on 8/11/17.
//  Copyright © 2017 Divya Mereddy. All rights reserved.
//

import UIKit

class SymptomsViewController: UIViewController {
    
    var symptoms = [String]()
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func plusButtonWasPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add your symptom",
                                      message: nil,
                                      preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Your symptom"
        }
        
        let addAction = UIAlertAction(title: "Add Symptom",
                                      style: .default) { (action) in
                                        
                                        if let symptomText = alert.textFields?.first?.text {
                                            self.symptoms.append(symptomText)
                                            self.tableView.reloadData()
                                        }
        }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

    }

extension SymptomsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symptoms.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "SymptomCell", for:
                indexPath) as! SymptomCell
            let symptom = symptoms[indexPath.row]
            cell.label.text = symptom
            cell.symptom = symptom
            return cell
    }
}
