//
//  DogViewModel.swift
//  DogSpotting
//
//  Created by Zoe Cutler on 4/6/23.
//

import SwiftUI

class DogViewModel: ObservableObject {
    let directoryService = DirectoryService()
    
    // TODO: Store an array of dogs that the user has seen.
        
    init() {
        // TODO: block of code to run when a ViewModel instance is created
    }
    
    func addNewDog(_ name: String, size: DogSize) {
        // TODO: Ensure size is strictly typed (i.e.: use an enum instead of a string.)
        // TODO: Add a new dog to our array of dogs.
    }
    
    func saveDogs() {
        // TODO: Use the function defined in the Encodable extension to save the dogs the user has seen.
    }
    
    func loadDogs() {
        // TODO: Use the function defined in the Decodable extension to load previously saved dogs.
    }
}
