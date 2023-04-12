//
//  DogSize.swift
//  DogSpotting
//
//  Created by Zoe Cutler on 4/11/23.
//

import Foundation

enum DogSize: String, CaseIterable, Identifiable, Codable {
    
    var id: String {
        self.rawValue
    }
    
    //TODO: Add cases to represent the different sizes of dogs that exist.
    case idk
}
