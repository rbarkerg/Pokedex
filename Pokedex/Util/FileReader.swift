//
//  FileReader.swift
//  Pokedex
//
//  Created by Reggie Barker on 5/3/24.
//

import Foundation

/// Helper to read local json files 
class FileReader {
    static func from(json fileName: String) -> Data {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"), let data = try? Data(contentsOf: url) else {
            fatalError("json not found")
        }
    return data;
    }
}
