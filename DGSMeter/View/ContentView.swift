
import Foundation
import SwiftUI



struct ContentView: View {
    
    @StateObject private var vm = ViewModel()
    @StateObject private var gm = GeometriModel()
    @StateObject private var tm = TurkceModel()
    
    
    @State var MatprogressValue : Float = 0.0
    @State var GeoprogressValue : Float = 0.0
    @State var TurkceprogressValue : Float = 0.0
    
    @State var selected = "Matematik"

    var lessons = ["Matematik","Geometri","Türkçe"]

    
    
    
    var body: some View {
        
        NavigationView {
      
            VStack(spacing:10){
                Picker("Please choose a color", selection: $selected) {
                        ForEach(lessons, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                 
                Spacer()
                             
                if selected == "Matematik" {
                    VStack{
                        
                        MatProgressBar(progress: $MatprogressValue)
                            .frame(width: 80, height: 100)
                            .onAppear(){
                                MatprogressValue = Float(vm.savedItems.count) / 33.0
                            }
                            
                        Text("Matematik")
                            .bold()
                    }
                    
                    
                    
                    
                    Button("Toggle Finished" ,  action: vm.sortFavs)
                        .foregroundColor(.red)
                        .padding()
                  
                        List{
                            ForEach(vm.filteredItems){ item in
                                HStack{
                                    Image(systemName: vm.contains(item) ? "checkmark.circle" : "circle")
                                        .foregroundColor(vm.contains(item) ? .green : .black)
                                        
                                        .onTapGesture {
                                            vm.toggleFav(item: item)
                                        
                                            MatprogressValue = Float(vm.savedItems.count) / 33.0
                                        }
                                    
                                    VStack(alignment: .leading){
                                        Text(item.title)
                                            .font(.headline)
                                            .strikethrough(vm.contains(item) ? true : false)
                                    }
                                    Spacer()
                                    
                                    
                                }
                                
                            }
                        }
                    
                //MARK : Geometri Segmented Page
                }else if selected == "Geometri" {
                    //MARK :
                    
                    VStack{
                        
                        GeoProgressBar(progress: self.$GeoprogressValue)
                            .frame(width: 80, height: 100)
                            .onAppear{
                                GeoprogressValue = Float(gm.savedItems.count) / 5.0
                            }
                        Text("Geometri")
                            .bold()
                    }
                    
                    Button("Toggle Favorites" ,  action: gm.sortFavs)
                        .padding()
                    
                    List{
                        ForEach(gm.filteredItems){ item in
                            HStack{
                                Image(systemName: gm.contains(item) ? "checkmark.circle" : "circle")
                                    .foregroundColor(gm.contains(item) ? .green : .black)
                                    .onTapGesture {
                                        gm.toggleFav(item: item)
                                        GeoprogressValue = Float(gm.savedItems.count) / 5.0
                                    }
                                
                                VStack(alignment: .leading){
                                    Text(item.title)
                                        .font(.headline)
                                        .strikethrough(gm.contains(item) ? true : false)
                                }
                                Spacer()
                            }
                        }
                    }
                    .cornerRadius(30)
                    
                    
                
                //MARK : Türkçe Segmented Page
                }else {
                    VStack{
                        MatProgressBar(progress: self.$TurkceprogressValue)
                            .frame(width: 80, height: 100)
                            .onAppear{
                                TurkceprogressValue = Float(tm.savedItems.count) / 5.0
                            }
                        Text("Türkçe")
                            .bold()
                    }
                    Button("Toggle Favorites" ,  action: tm.sortFavs)
                        .padding()
                    
                    List{
                        ForEach(tm.filteredItems){ item in
                            HStack{
                                Image(systemName: tm.contains(item) ? "checkmark.circle" : "circle")
                                    .foregroundColor(tm.contains(item) ? .green : .black)
                                    .onTapGesture {
                                        tm.toggleFav(item: item)
                                        TurkceprogressValue = Float(tm.savedItems.count) / 5.0
                                    }
                                
                                VStack(alignment: .leading){
                                    Text(item.title)
                                        .font(.headline)
                                        .strikethrough(tm.contains(item) ? true : false)
                                }
                                Spacer()
                            }
                        }
                    }
                    .cornerRadius(30)
                }
            }

            .navigationTitle("DGS KONULAR")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}


struct MatProgressBar : View{
    
    @Binding var progress : Float
    
    var maxValue = 0.1
    
    var body: some View {
        
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.6)
                .foregroundColor(Color.yellow)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
        
            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .foregroundColor(.black)
                .bold()
        }
    }
    
}

struct GeoProgressBar : View{
    
    @Binding var progress : Float
    
    var maxValue = 0.1
    
    var body: some View {
        
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.6)
                .foregroundColor(Color.yellow)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
        
            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .foregroundColor(.black)
                .bold()
        }
    }
    
}

struct TurkceProgressBar : View{
    
    @Binding var progress : Float
    
    var maxValue = 0.1
    
    var body: some View {
        
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.6)
                .foregroundColor(Color.yellow)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
        
            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .foregroundColor(.black)
                .bold()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
