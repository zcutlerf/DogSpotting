//
//  DirectoryService.swift
//  DogSpotting
//
//  Created by Cory Tripathy on 4/6/23.
//

import Foundation

final class DirectoryService {
    public func readModelFromDisk<T: Decodable>() -> [T] {
        do {
            let directory = try FileManager.default
                .url(for: .documentDirectory,
                     in: .userDomainMask,
                     appropriateFor: nil,
                     create: false)
            let encodedModels = try Data(contentsOf: directory.appendingPathComponent("\(T.self).json"))
            let decodedModels = try JSONDecoder()
                .decode([T].self, from: encodedModels)
            return decodedModels
        } catch {
            debugPrint(error)
            return []
        }
    }
    
    public func writeModelToDisk<T:Encodable>(_ models: [T]) {
        do {
            let directory = try FileManager.default
                .url(for: .documentDirectory,
                     in: .userDomainMask,
                     appropriateFor: nil,
                     create: false)
            try JSONEncoder()
                .encode(models)
                .write(to: directory.appendingPathComponent("\(T.self).json"))
        } catch {
            debugPrint(error)
        }
    }
}
