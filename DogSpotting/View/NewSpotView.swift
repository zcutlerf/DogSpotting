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
    @State private var selectedSize = DogSize.small
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
                        isTakingPhoto = true
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
                    ForEach(DogSize.allCases) { size in
                        Text(size.rawValue)
                            .tag(size)
                    }
                }
                                
                Section {
                    Button {
                        dogVM.addNewDog(name, size: selectedSize, image: uiimage!)
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
                .disabled(name == "" || uiimage == nil)
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
