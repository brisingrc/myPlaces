//
//  StorageManager.swift
//  myPlaces
//
//  Created by Мак on 7/8/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place){
        
        try! realm.write {
            realm.add(place)
        }
    }
    static func deleteObject(_ place: Place){
        try! realm.write {
            realm.delete(place)
        }
    }
}
