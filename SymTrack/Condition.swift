//
//  Condition.swift
//  Symptom Tracker
//
//  Created by Divya Mereddy on 8/16/17.
//  Copyright © 2017 Divya Mereddy. All rights reserved.
//

import Foundation
import RealmSwift

class Condition: Object {
    dynamic var name = ""
    let symptoms = List<Symptom>()

    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
