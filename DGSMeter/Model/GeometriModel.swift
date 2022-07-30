//
//  GeometriModel.swift
//  DGSMeter
//
//  Created by umut yalçın on 14.07.2022.
//

import Foundation


struct Geometri : Identifiable , Codable{
    var id : Int
    var title : String
    var isComplete : Bool
    
    
    static var sampleItems : [Geometri] {
        
        let topics = ["Geometrik Kavramlar ve Doğruda açılar",
                      "Çokgenler ve Dörtgenler",
                      "Çember ve Daire",
                      "Analitik Geometri",
                      "Katı Cisimler"
                    ]
        
        var tempList = [Geometri]()
        
        
        
        for i in 0..<topics.count {
            let id = i
            let title = "\(topics[i])"
            tempList.append(Geometri(id: id, title: title, isComplete: false))
        }
        
        return tempList
    }
    
}
