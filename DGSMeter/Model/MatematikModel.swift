//
//  Model.swift
//  DGSMeter
//
//  Created by umut yalçın on 14.07.2022.
//

import Foundation
import SwiftUI

struct Matematik : Identifiable , Codable{
    var id : Int
    var title : String
    var isComplete : Bool
    
    static var sampleItems : [Matematik] {
        
        let topics = ["Temel Kavramlar",
                      "Rasyonel Sayılar",
                      "Sayı Sistemleri",
                      "Asal Çarpanlar",
                      "Bölme ve Bölünebilme Kuralları",
                      "Faktöriyel",
                      "Obeb (Ebob) ve Okek (Ekok)",
                      "Denklem Çözme",
                      "Basit Eşitsizlikler",
                      "Mutlak Değer",
                      "Üslü Sayılar",
                      "Kareköklü Sayılar",
                      "Çarpanlara Ayırma",
                      "Oran-Orantı",
                      "Sayı Problemleri",
                      "Kesir Problemleri",
                      "Sayfa Problemleri",
                      "Saat Problemleri",
                      "Yaş Problemleri",
                      "Yüzde Problemleri",
                      "Kar ve Zarar Problemleri",
                      "Faiz Problemleri",
                      "Karışım Problemleri",
                      "Hız Hareket Problemleri",
                      "İşçi ve Havuz Problemleri",
                      "Kümeler",
                      "Fonksiyonlar",
                      "İşlem",
                      "Modüler Aritmetik",
                      "Permütasyon",
                      "Kombinasyon",
                      "Olasılık",
                      "Sayısal Mantık"]
        
        var tempList = [Matematik]()
        
        
        
        for i in 0..<topics.count {
            let id = i
            let title = "\(topics[i])"
            tempList.append(Matematik(id: id, title: title, isComplete: false))
        }
        
        return tempList
    }
}





