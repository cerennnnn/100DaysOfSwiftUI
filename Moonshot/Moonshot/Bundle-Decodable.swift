//
//  Bundle-Decoder.swift
//  Moonshot
//
//  Created by Ceren Güneş on 27.11.2022.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String ) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
//        if it passed it goes here
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
//        if we're still here we've found the file & loaded the data to its data instance and now we can decode it
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
//        [String:Astranout] dictionary
        return loaded
        
    }
}
