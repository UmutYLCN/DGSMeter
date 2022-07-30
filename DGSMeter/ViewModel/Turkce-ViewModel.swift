
import Foundation
import SwiftUI

extension ContentView {
    
    final class TurkceModel : ObservableObject {
        
        @Published var items = [Turkce]()
        
        @Published var showingFavs = false
        
        @Published var savedItems :  Set<Int> = [1,7]
        
        
        var filteredItems : [Turkce] {
            if showingFavs {
                return items.filter {savedItems.contains($0.id)}
            }else{
                return items
            }
        }
        
        private var db = DatabaseTurkce()
        
        init(){
            self.savedItems = db.load()
            self.items = Turkce.sampleItems
        }
        
        func sortFavs(){
            withAnimation {
                showingFavs.toggle()
            }
        }
        
        func contains(_ item : Turkce) -> Bool{
            savedItems.contains(item.id)
        }
        
        
        func toggleFav(item : Turkce){
    
            if contains(item){
                savedItems.remove(item.id)
                
            }else{
                savedItems.insert(item.id)
            }
            db.save(items: savedItems)
        }
        
    }
    
}
