//
//  ContentView.swift
//  DogSpotting
//
//  Created by Zoe Cutler on 4/6/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dogVM = DogViewModel()
    
    @State private var isShowingNewSpotSheet = false
    
    var body: some View {
        NavigationStack {
            // TODO: add accessibility labels to views
            // TODO: add an accent color, make sure it is usable in light, dark modes; normal, high contrast modes
            List(dogVM.dogsSeen) { dog in
                HStack {
                    //User-inputted image of the dog spotted
                    Image(uiImage: dog.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 200.0)
                    
                    //Information about the dog spotted
                    VStack(alignment: .leading) {
                        //Dog's name
                        Text(dog.name)
                            .font(.title)
                        Text(dog.size.rawValue)
                            .font(.title2)
                        
                        //Time when dog was seen
                        Text("Seen on \(dog.dateSeen.formatted())")
                            .foregroundColor(.secondary)
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
