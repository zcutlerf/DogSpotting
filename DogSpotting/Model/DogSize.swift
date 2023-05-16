//
//  DogSize.swift
//  DogSpotting
//
//  Created by Zoe Cutler on 4/11/23.
//

import Foundation

///Represents the different sizes of dogs that can be seen.
enum DogSize: String, CaseIterable, Identifiable, Codable {
    
    var id: String {
        self.rawValue
    }
    
    case small, medium, large
}
