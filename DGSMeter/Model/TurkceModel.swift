//
//  TurkceModel.swift
//  DGSMeter
//
//  Created by umut yalçın on 14.07.2022.
//

import Foundation


import Foundation


struct Turkce : Identifiable , Codable{
    var id : Int
    var title : String
    var isComplete : Bool
    
    
    static var sampleItems : [Turkce] {
        
        let topics = ["Sözcükte Anlam",
                      "Cümlede Anlam",
                      "Paragraf",
                      "Anlatım Bozuklukları",
                      "Sözel Mantık"
                    ]
        
        var tempList = [Turkce]()
        
        
        
        for i in 0..<topics.count {
            let id = i
            let title = "\(topics[i])"
            tempList.append(Turkce(id: id, title: title, isComplete: false))
        }
        
        return tempList
    }
    
}
