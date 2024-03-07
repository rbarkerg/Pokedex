//
//  PokemonList.swift
//  Pokedex
//
//  Created by Reggie Barker on 5/3/24.
//

import Foundation

/// T can be any other model
struct ResponseList<T: Codable>: Codable {
    var count: Int
    var results: [T]
}
