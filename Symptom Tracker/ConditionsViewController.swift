//
//  ConditionsViewController.swift
//  Symptom Tracker
//
//  Created by Divya Mereddy on 8/1/17.
//  Copyright © 2017 Divya Mereddy. All rights reserved.
//

import UIKit

class ConditionsViewController: UIViewController {

    var conditions = [String]()
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
                self.conditions.append(conditionsText)
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
}

 extension ConditionsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conditions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConditionCell", for: indexPath) as! ConditionCell
        let condition = conditions[indexPath.item]
        cell.button.setTitle(condition, for: .normal)
        cell.condition = condition
        cell.delegate = self
        return cell
    }
    
}

extension ConditionsViewController: ConditionCellDelegate {
    
    func conditionButtonWasPressed(condition: String) {
        print(condition)
        performSegue(withIdentifier: "symptomScreen", sender: self)
    }
    
}
