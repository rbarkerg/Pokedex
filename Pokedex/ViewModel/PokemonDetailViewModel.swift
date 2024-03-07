//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Reggie Barker on 6/3/24.
//

import Foundation
import SwiftUI

class PokemonDetailViewModel: BaseViewModel {
    private var pokemon: Pokemon
    private var pokemonDetail: PokemonDetail
    
    init(model: Pokemon) {
        self.pokemon = model
        self.pokemonDetail = PokemonDetail()
    }
    
    override func getData(clear: Bool = true) {
        state = .loading
        provider.request(.getPokemonBy(name: pokemon.name), completion: { result in
            do {
                let response = try result.get()
                let pokemon = try response.map(PokemonDetail.self)
                self.pokemonDetail = pokemon
                self.state = .idle
            } catch {
                self.state = .error(error: "error al cargar pokemons")
                self.state = .idle
            }
        })
    }
    
    func imageUrlFrom() -> URL {
        guard let url = URL(string: String(format: "PokemonImagesUrlHD".localization(), internalPokemonId(stringUrl: pokemon.url))) else {
            fatalError("url ")
        }
        return url
    }
    
    private func internalPokemonId(stringUrl: String) -> String {
        guard let id = stringUrl.split(separator: "/").last else {
            fatalError("internal id not found")
        }
        return id.description
    }
    
    var name: String {
        return pokemon.name
    }
    
    var pokedexNumber: String {
        var number = ""
        switch pokemonDetail.id {
        case 0...9:
            number = "#00"
        case 10...99:
            number = "#0"
        default:
            number = "#"
        }
        return number+pokemonDetail.id.description
    }
    
    var height: String {
        return String(format: "HeightWithParam".localization(), pokemonDetail.height)
    }
    
    var weight: String {
        return String(format: "WeightWithParam".localization(), pokemonDetail.weight)
    }
    
    var types: [PokeType] {
        return pokemonDetail.types.map { $0.type.name  }
    }
    
    var gradient: [Color] {
        return types.map { Color.init($0.rawValue) }
    }
}
