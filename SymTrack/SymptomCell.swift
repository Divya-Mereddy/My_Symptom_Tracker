//
//  SymptomCell.swift
//  Symptom Tracker
//
//  Created by Divya Mereddy on 8/11/17.
//  Copyright © 2017 Divya Mereddy. All rights reserved.
//

import UIKit
import RealmSwift

class SymptomCell: UITableViewCell {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var displayTimeLabel: UILabel!
    @IBOutlet var intensityControl: UISegmentedControl!
    
    var symptom: Symptom!
    
    override func awakeFromNib() {
        label.layer.cornerRadius = 3.0
    }
    
    @IBAction func intensityControlValueDidChange(sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        RealmHelper.updateSymptom(symptomToBeUpdated: symptom, newIntensity: sender.selectedSegmentIndex + 1)
    }
    
}
