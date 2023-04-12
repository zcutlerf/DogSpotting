//
//  UIImage+Codable.swift
//  DogSpotting
//
//  Created by Cory Tripathy on 4/12/23.
//

import Foundation
import UIKit

extension UIImage: Codable {
    enum CodingKeys: CodingKey {
        case data
        case scale
        case orientation
    }
}

extension Decodable where Self: UIImage {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let scale = try container.decode(CGFloat.self, forKey: .scale)
        let data = try container.decode(Data.self, forKey: .data)
        let orientation = try container.decode(Int.self, forKey: .orientation)
        if let uiImageOrientation = UIImage.Orientation(rawValue: orientation),
           let decodedImage = UIImage.init(data: data, scale: scale),
           let cgImage = decodedImage.cgImage {
            self = UIImage(cgImage: cgImage, scale: decodedImage.scale, orientation: uiImageOrientation) as! Self
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "There was an error loading the image."))
        }
    }
}

extension Encodable where Self: UIImage {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.pngData(), forKey: .data)
        try container.encode(self.imageOrientation.rawValue, forKey: .orientation)
        try container.encode(self.scale, forKey: .scale)
    }
}
