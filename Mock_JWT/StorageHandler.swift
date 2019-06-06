//
//  StorageHandler.swift
//  Mock_JWT
//
//  Created by Rahul Garg on 06/06/19.
//  Copyright © 2019 Rahul Garg. All rights reserved.
//

import Foundation

class StorageHandler {
    static var shared = StorageHandler()
    
    private init() {}
    
    
    //MARK:- Helper Methods
    func addToDB(value: String, key: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
    
    func fetchFromDBFor(key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
}
