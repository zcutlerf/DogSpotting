//
//  ContentView.swift
//  DogSpotting
//
//  Created by Zoe Cutler on 4/6/23.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject var dogVM = DogViewModel()
    
    @State private var isShowingNewSpotSheet = false
    
    var body: some View {
        NavigationStack {
            List(dogVM.dogs) { dog in
                HStack {
                    //User-inputted image of the dog spotted
                    Image(dog.photoName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 200.0)
                    
                    //Information about the dog spotted
                    VStack(alignment: .leading) {
                        //Dog's name
                        Text(dog.name)
                            .font(.title)
                        
                        //Time when dog was seen
                        Text("Seen on \(dog.dateSpotted.formatted())")
                            .foregroundColor(.secondary)
                        
                        //Size of Doge
                        Text(dog.size.rawValue)
                    }
                }
            }
            .sheet(isPresented: $isShowingNewSpotSheet, content: {
                NewSpotView(dogVM: dogVM)
            })
            .navigationTitle("Dogs Spotted")
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingNewSpotSheet.toggle()
                    } label: {
                        Label("New Dog", systemImage: "eyes")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
