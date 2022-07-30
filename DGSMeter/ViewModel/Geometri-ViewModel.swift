//
//  Geometri-ViewModel.swift
//  DGSMeter
//
//  Created by umut yalçın on 14.07.2022.
//

import Foundation
import SwiftUI

extension ContentView {
    
    final class GeometriModel : ObservableObject {
        
        @Published var items = [Geometri]()
        
        @Published var showingFavs = false
        
        @Published var savedItems :  Set<Int> = [1,7]
        
        
        var filteredItems : [Geometri] {
            if showingFavs {
                return items.filter {savedItems.contains($0.id)}
            }else{
                return items
            }
        }
        
        private var db = DatabaseGeometri()
        
        init(){
            self.savedItems = db.load()
            self.items = Geometri.sampleItems
        }
        
        func sortFavs(){
            withAnimation {
                showingFavs.toggle()
            }
        }
        
        func contains(_ item : Geometri) -> Bool{
            savedItems.contains(item.id)
        }
        
        
        func toggleFav(item : Geometri){
    
            if contains(item){
                savedItems.remove(item.id)
                
            }else{
                savedItems.insert(item.id)
            }
            db.save(items: savedItems)
        }
        
    }
    
}
