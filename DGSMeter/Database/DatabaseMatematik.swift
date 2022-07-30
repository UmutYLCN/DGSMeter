//
//  Database.swift
//  DGSMeter
//
//  Created by umut yalçın on 14.07.2022.
//

import Foundation

final class DatabaseMatematik {
    private let FAV_KEY = "fav_key_matematik"
    
    func save(items : Set<Int>){
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
        
    }
    
    
    func load() -> Set<Int>{
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? [Int]()
        return Set(array)
    }
}


