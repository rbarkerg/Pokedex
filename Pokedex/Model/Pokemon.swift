//
//  Pokemon.swift
//  Pokedex
//
//  Created by Reggie Barker on 5/3/24.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    var id: UUID
    var name: String
    var url: String
    
    init() {
        self.id = UUID()
        self.name = ""
        self.url = ""
    }
    
}

extension Pokemon {
    enum keys: String, CodingKey {
        case name
        case url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        id = UUID()
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)
    }
    
    static func mock() -> Pokemon {
        let mockData = FileReader.from(json: "Pokemon")
        let pokemon = try! JSONDecoder().decode(Pokemon.self, from: mockData)
        return pokemon
    }
    
}

