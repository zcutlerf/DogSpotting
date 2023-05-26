//
//  DogModel.swift
//  DogSpotting
//
//  Created by Zoe Cutler on 4/6/23.
//

import Foundation
import UIKit

///Represents a dog the user has seen.
struct DogModel: Identifiable, Codable {
    var id = UUID()
    var name: String
    var dateSeen = Date()
    var size: DogSize
    var image: UIImage
    
//    static var sampleDogs: [DogModel] = [
//        DogModel(name: "Fido", size: .small, photoName: "sampleDog"),
//        DogModel(name: "Spot", size: .medium, photoName: "sampleDog"),
//        DogModel(name: "Daisy", size: .large, photoName: "sampleDog")
//    ]
}

