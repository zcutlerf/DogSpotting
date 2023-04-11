//
//  DogModel.swift
//  DogSpotting
//
//  Created by Zoe Cutler on 4/6/23.
//

import Foundation

struct DogModel: Identifiable, Codable {
    
    enum DogSize: String, CaseIterable, Codable {
        case smollboi, medium, large
//        case none
    }
    
    var id = UUID()
    let name: String
    let size: DogSize
    var dateSpotted = Date()
    let photoName: String // the string? or the photo itself?
    static let dummyModels: [DogModel] = [
        .init(name: "Firiq", size: .large, photoName: "sampleDog")]
}
