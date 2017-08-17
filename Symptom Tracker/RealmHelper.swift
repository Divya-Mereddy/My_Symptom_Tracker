//
//  RealmHelper.swift
//  Symptom Tracker
//
//  Created by Divya Mereddy on 8/16/17.
//  Copyright © 2017 Divya Mereddy. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    
    static func addCondition(condition: Condition) {
        let realm = try! Realm()
        try! realm.write () {
            realm.add(condition)
        }
    }
    
    static func add(symptom: Symptom, to condition: Condition) {
        let realm = try! Realm()
        try! realm.write () {
            realm.add(symptom)
            condition.symptoms.append(symptom)
        }
    }
    
    static func retrieveCondition()  -> Results<Condition> {
        let realm = try! Realm()
        return realm.objects(Condition.self)
    }
    
    static func updateSymptom(symptomToBeUpdated: Symptom, newSymptom: Symptom) {
        let realm = try! Realm()
        try! realm.write() {
            symptomToBeUpdated.name = newSymptom.name
            symptomToBeUpdated.intensity = newSymptom.intensity
        }
    }
}

