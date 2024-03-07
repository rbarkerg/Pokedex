//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Reggie Barker on 5/3/24.
//

import SwiftUI

class PokemonListViewModel: BaseListViewModel<Pokemon> {
    @Published var showErrorAler = false
    
    override func getData(clear: Bool = true) {
        state = .loading
        provider.request(.getPokemons(offset: offset, limit: limit), completion: { result in
            do {
                let response = try result.get()
                let pokemonList = try response.map(ResponseList<Pokemon>.self)
                if clear {
                    self.totalDataCount = pokemonList.count
                    self.curentData = pokemonList.results
                } else {
                    self.curentData += pokemonList.results
                }
                self.state = .idle
            } catch {
                self.state = .error(error: "Error".localization())
                self.showErrorAler = true
                self.state = .idle
            }
        })
    }
    
    func imageUrlFrom(pokemon:Pokemon) -> URL {
        guard let url = URL(string: String(format: "PokemonImagesUrl".localization(), internalPokemonId(stringUrl: pokemon.url))) else {
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
    
    func findBy(id: UUID) -> Pokemon {
        if let pokemon =  curentData.first(where: { $0.id == id }) {
            return pokemon
        }
        fatalError("Pokemon not found")
    }
}
