//
//  DirectoryService.swift
//  DogSpotting
//
//  Created by Cory Tripathy on 4/6/23.
//

import Foundation

/// Manages persisting your models to the phone's file directory
class DirectoryService {
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func saveModelToDisk<T: Codable>(_ models: [T]) {
        do {
            try encoder
                .encode(models)
                .write(to: directory().appendingPathComponent("\(T.self).json"))
        } catch {
            debugPrint(error)
        }
    }
    
    func readModelToDisk<T:Codable>() -> [T] {
        do {
            let encodedModels = try Data(contentsOf: directory().appendingPathComponent("\(T.self).json"))
            let decodedModels = try decoder
                .decode([T].self, from: encodedModels)
            return decodedModels
        } catch {
            debugPrint(error)
            return []
        }
    }
    
    private func directory() throws -> URL {
        try FileManager.default
            .url(for: .documentDirectory,
                 in: .userDomainMask,
                 appropriateFor: nil,
                 create: false)
    }
}
