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
    @State private var size = DogModel.DogSize.smollboi
    @State private var image: UIImage?
    @State private var showingImagePicker = false
    
    
    var body: some View {
        NavigationStack {
            Form {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 200.0)
                } else {
                    Button {
                        showingImagePicker = true
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
                
                Picker("Size", selection: $size) {
                    Text("small")
                        .tag(DogModel.DogSize.smollboi)
                    Text("med")
                        .tag(DogModel.DogSize.medium)
                    Text("large")
                        .tag(DogModel.DogSize.large)
                }
                
                Section {
                    Button {
                        dogVM.addNewDog(with: name, and: size)
                        dismiss()
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
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(sourceType: .camera, selectedImage: $image)
            }
        }
    }
}

struct NewSpotView_Previews: PreviewProvider {
    static var previews: some View {
        NewSpotView(dogVM: DogViewModel())
    }
}
