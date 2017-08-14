//
//  ConditionCell.swift
//  Symptom Tracker
//
//  Created by Divya Mereddy on 8/10/17.
//  Copyright © 2017 Divya Mereddy. All rights reserved.
//

import UIKit

protocol ConditionCellDelegate: class {
    func conditionButtonWasPressed(condition: String)
}

class ConditionCell: UICollectionViewCell {
    
    @IBOutlet var button: UIButton!
    
    var condition: String!
    
    weak var delegate: ConditionCellDelegate?
    
    override func awakeFromNib() {
        button.layer.cornerRadius = 3.0
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        delegate?.conditionButtonWasPressed(condition: condition)
        
    }
    
}
