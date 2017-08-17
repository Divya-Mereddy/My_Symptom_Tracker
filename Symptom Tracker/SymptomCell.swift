//
//  SymptomCell.swift
//  Symptom Tracker
//
//  Created by Divya Mereddy on 8/11/17.
//  Copyright © 2017 Divya Mereddy. All rights reserved.
//

import UIKit

class SymptomCell: UITableViewCell {
    
    @IBOutlet var label: UILabel!
    
    var symptom: String!
    
    override func awakeFromNib() {
        label.layer.cornerRadius = 3.0
    }
    
    @IBOutlet var displayTimeLabel: UILabel!
    
}
