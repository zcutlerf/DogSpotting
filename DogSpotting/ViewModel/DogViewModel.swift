//
//  DogViewModel.swift
//  DogSpotting
//
//  Created by Zoe Cutler on 4/6/23.
//

import SwiftUI

@MainActor
class DogViewModel: ObservableObject {
    let directoryService = DirectoryService()
    
    @Published var dogs: [DogModel] = []
    
    init() {
        loadDogs()
    }
    
    func addNewDog(with name: String, and size: DogModel.DogSize) {
        let newDog = DogModel(name: name, size: size, photoName: "sampleDog")
        dogs.append(newDog)
        
        saveDogs()
    }
    
    func saveDogs() {
        directoryService.saveModelToDisk(dogs)
    }
    
    func loadDogs() {
        dogs = directoryService.readModelToDisk()
    }
}
