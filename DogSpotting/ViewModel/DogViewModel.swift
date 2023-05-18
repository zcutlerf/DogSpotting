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
        
    init() {
        // TODO: block of code to run when a ViewModel instance is created
    }
    
    func addNewDog(_ name: String, size: DogSize) {
        // TODO: Add a new dog to our array of dogs.
    }
    
    func saveDogs() {
        // TODO: Use the static function DirectoryService.writeModelToDisk(_:) to save our array of dogs to the app's documents directory.
    }
    
    func loadDogs() {
        // TODO: Use the static function DirectoryService.readModelFromDisk() to read our previously saved array of dogs from our app's documents directory.
    }
}
