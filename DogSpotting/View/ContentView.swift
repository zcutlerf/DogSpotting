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
            List {
                HStack {
                    //User-inputted image of the dog spotted
                    Image("sampleDog")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 200.0)
                    
                    //Information about the dog spotted
                    VStack(alignment: .leading) {
                        //Dog's name
                        Text("Fido")
                            .font(.title)
                        
                        //Time when dog was seen
                        Text("Seen on \(Date().formatted())")
                            .foregroundColor(.secondary)
                        
                        //Location where dog was spotted
                        Text("Latitude: \(CLLocation(latitude: 42.3314, longitude: -83.0458).coordinate.latitude.description)")
                        Text("Longitude: \(CLLocation(latitude: 42.3314, longitude: -83.0458).coordinate.longitude.description)")
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
