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
    dynamic var name = ""
    dynamic var intensity = 0
    dynamic var date = ""
}
