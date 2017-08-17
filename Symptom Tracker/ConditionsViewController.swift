//
//  ConditionsViewController.swift
//  Symptom Tracker
//
//  Created by Divya Mereddy on 8/1/17.
//  Copyright © 2017 Divya Mereddy. All rights reserved.
//

import UIKit
import RealmSwift

class ConditionsViewController: UIViewController {

    var conditions: Results<Condition>!
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        conditions = RealmHelper.retrieveCondition()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func plusButtonWasPressed(sender: UIButton) {
        
        let alert = UIAlertController(title: "Add your condition",
                                      message: nil,
                                      preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Your condition"
        }
        
        let addAction = UIAlertAction(title: "Add Condition",
                                      style: .default) { (action) in
        
            
            if let conditionsText = alert.textFields?.first?.text {
                let condition = Condition(name: conditionsText)
                RealmHelper.addCondition(condition: condition)
                self.conditions = RealmHelper.retrieveCondition()
                self.collectionView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
    
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "symptomScreen" {
            let vc = segue.destination as! SymptomsForConditionViewController
            vc.condition = sender as! Condition
        }
    }
}

 extension ConditionsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conditions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConditionCell", for: indexPath) as! ConditionCell
        let condition = conditions[indexPath.item]
        cell.button.setTitle(condition.name, for: .normal)
        cell.condition = condition
        cell.delegate = self
        return cell
    }
    
}

extension ConditionsViewController: ConditionCellDelegate {
    
    func conditionButtonWasPressed(condition: Condition) {
        print(condition)
        performSegue(withIdentifier: "symptomScreen", sender: condition)
    }
    
}
