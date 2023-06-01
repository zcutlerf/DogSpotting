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
    
    func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short

        let date = date

        // US English Locale (en_US)
        dateFormatter.locale = Locale.current
        return  dateFormatter.string(from: date) // Jan 2, 2001
    }
}
