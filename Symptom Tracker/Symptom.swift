//
//  Symptom.swift
//  Symptom Tracker
//
//  Created by Divya Mereddy on 8/16/17.
//  Copyright © 2017 Divya Mereddy. All rights reserved.
//

import Foundation
import RealmSwift

class Symptom: Object {
    
    private static var currentDateHash: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY"
        return dateFormatter.string(from: Date())
    }
    
    dynamic var name = ""
    dynamic var intensity = 0
    dynamic var dateHash = ""
    
    convenience init(name: String, intensity: Int = 5) {
        self.init()
        self.name = name
        self.intensity = intensity
        self.dateHash = Symptom.currentDateHash
    }
}
