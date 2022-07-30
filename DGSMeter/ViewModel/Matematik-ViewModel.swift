//
//  Content-ViewModel.swift
//  DGSMeter
//
//  Created by umut yalçın on 14.07.2022.
//

import Foundation
import SwiftUI


extension ContentView {
    
    //MARK : ViewModel
    
    final class ViewModel : ObservableObject {
        
        @Published var items = [Matematik]()
        
        @Published var showingFavs = false
        
        @Published var savedItems :  Set<Int> = [1,7]
        
        
        var filteredItems : [Matematik] {
            if showingFavs {
                return items.filter {savedItems.contains($0.id)}
            }else{
                return items
            }
        }
        
        private var db = DatabaseMatematik()
        
        init(){
            self.savedItems = db.load()
            self.items = Matematik.sampleItems
        }
        
        func sortFavs(){
            withAnimation {
                showingFavs.toggle()
            }
        }
        
        func contains(_ item : Matematik) -> Bool{
            savedItems.contains(item.id)
        }
        
        
        func toggleFav(item : Matematik){
    
            if contains(item){
                savedItems.remove(item.id)
                
            }else{
                savedItems.insert(item.id)
            }
            db.save(items: savedItems)
        }
        
    }

    
}


