//
//  Codable+Extension.swift
//  DogSpotting
//
//  Created by Cory Tripathy on 4/6/23.
//

import Foundation

extension Decodable {
    func readModelFromDisk<T: Decodable>() -> [T] {
        do {
            let directory = try FileManager.default
                .url(for: .documentDirectory,
                     in: .userDomainMask,
                     appropriateFor: nil,
                     create: false)
            let encodedModels = try Data(contentsOf: directory)
            let decodedModels = try JSONDecoder()
                .decode([T].self, from: encodedModels)
            return decodedModels
        } catch {
            debugPrint(error)
            return []
        }
    }
}

extension Encodable {
    func writeModelToDisk<T:Encodable>(_ models: [T]) {
        do {
            let directory = try FileManager.default
                .url(for: .documentDirectory,
                     in: .userDomainMask,
                     appropriateFor: nil,
                     create: false)
            try JSONEncoder()
                .encode(models)
                .write(to: directory)
        } catch {
            debugPrint(error)
        }
    }
}
