//
//  DogViewModel.swift
//  DogSpotting
//
//  Created by Zoe Cutler on 4/6/23.
//

import SwiftUI

///Stores the dogs the user has seen, and handles CRUD operations for the user's data.
class DogViewModel: ObservableObject {
    // TODO: Store an array of dogs that the user has seen.
    @Published var dogsSeen: [DogModel] = []
        
    init() {
        loadDogs()
    }
    
    func addNewDog(_ name: String, size: DogSize, image: UIImage) {
        let newDog = DogModel(name: name, size: size, image: image)
        dogsSeen.append(newDog)
        saveDogs()
    }
    
    func saveDogs() {
        DirectoryService.writeModelToDisk(dogsSeen)
    }
    
    func loadDogs() {
        dogsSeen = DirectoryService.readModelFromDisk()
    }
}
