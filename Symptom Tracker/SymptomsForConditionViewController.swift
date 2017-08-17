//
//  SymptomsForConditionViewController.swift
//  Symptom Tracker
//
//  Created by Divya Mereddy on 8/11/17.
//  Copyright © 2017 Divya Mereddy. All rights reserved.
//

import UIKit
import RealmSwift

class SymptomsForConditionViewController: UIViewController {
    
    var condition: Condition!
    
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
                let symptom = Symptom(name: symptomText)
                RealmHelper.add(symptom: symptom, to: self.condition)
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

extension SymptomsForConditionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return condition.symptoms.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "SymptomCell", for:
                indexPath) as! SymptomCell
            let symptom = condition.symptoms[indexPath.row]
            cell.symptom = symptom
            cell.label.text = symptom.name
            cell.displayTimeLabel.text = symptom.dateHash
            cell.intensityControl.selectedSegmentIndex = symptom.intensity - 1
            return cell
    }
}
