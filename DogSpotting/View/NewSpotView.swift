//
//  NewSpotView.swift
//  DogSpotting
//
//  Created by Zoe Cutler on 4/6/23.
//

import SwiftUI
import CoreLocation

struct NewSpotView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var dogVM: DogViewModel
    
    @State private var name = ""
    @State private var location = CLLocation(latitude: 42.3314, longitude: -83.0458)
    @State private var image: Image?
    @State private var selectedSize = ""
    
    var body: some View {
        NavigationStack {
            Form {
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 200.0)
                } else {
                    Button {
                        //TODO: Ask for the user's camera, and take photo.
                    } label: {
                        HStack {
                            Image(systemName: "camera")
                            Image(systemName: "plus.circle")
                        }
                        .imageScale(.large)
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                TextField("Dog's Name", text: $name)
                Picker("Dog Size", selection: $selectedSize) {
                    Text("Extra Small").tag("xs")
                    Text("Small").tag("s")
                    Text("Medium").tag("m")
                    Text("Large").tag("l")
                    Text("Extra Large").tag("xl")
                }
                                
                Section {
                    Button {
                        
                    } label: {
                        HStack {
                            Spacer()
                            
                            Text("Save")
                            
                            Spacer()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .disabled(name == "" || image == nil)
            }
            .navigationTitle("You saw one???")
        }
    }
}

struct NewSpotView_Previews: PreviewProvider {
    static var previews: some View {
        NewSpotView(dogVM: DogViewModel())
    }
}
