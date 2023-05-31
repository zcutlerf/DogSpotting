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
}

