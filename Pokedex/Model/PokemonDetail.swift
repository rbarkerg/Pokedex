//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Reggie Barker on 5/3/24.
//

import Foundation

struct PokemonDetail: Codable {
    var height: Int = 0
    var id: Int = 0
    var weight: Int = 0
    var types: [Types] = []
}

enum PokeType: String, Codable{
    case normal, fighting, flying, poison,ground, rock, bug, ghost, steel, fire, water, grass, electric, psychic, ice, dragon, dark, fairy, unknown, shadow
}

/// Helpers
struct PokemonType: Codable {
    let name: PokeType
}

struct Types: Codable {
    let type: PokemonType
}

