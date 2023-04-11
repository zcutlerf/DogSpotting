//
//  NewSpotView.swift
//  DogSpotting
//
//  Created by Zoe Cutler on 4/6/23.
//

import SwiftUI

struct NewSpotView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var dogVM: DogViewModel
    
    @State private var name = ""
    @State private var uiimage: UIImage?
    @State private var selectedSize = "Small"
    @State private var isTakingPhoto = false
    
    var body: some View {
        NavigationStack {
            Form {
                if let uiimage = uiimage {
                    Image(uiImage: uiimage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 200.0)
                } else {
                    Button {
                        //TODO: Ask for the user's camera, and present ImagePicker view.
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
                .disabled(name == "")
            }
            .navigationTitle("You saw one???")
        }.sheet(isPresented: $isTakingPhoto) {
            ImagePicker(selectedImage: $uiimage)
        }
    }
}

struct NewSpotView_Previews: PreviewProvider {
    static var previews: some View {
        NewSpotView(dogVM: DogViewModel())
    }
}
