//
//  PokemonDetailViewModelTests.swift
//  PokedexTests
//
//  Created by Reggie Barker on 7/3/24.
//

import XCTest
import SwiftUI

final class PokemonDetailViewModelTests: XCTestCase {

    let pokemonListVM = PokemonListViewModel(provider: PokeApiProviderTest)
    var pokemon =  Pokemon()
    var pokemonVM =  PokemonDetailViewModel(model: Pokemon())
            
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        pokemonListVM.getData()
        pokemon = pokemonListVM.curentData.first!
        pokemonVM = PokemonDetailViewModel(model: pokemon)
        pokemonVM.provider = PokeApiProviderTest
        pokemonVM.getData()
    }

    override func tearDownWithError() throws { }

    func testPokemonDetailViewModel() throws {
        
        // width
        let weight = pokemonVM.weight
        let expectedWeight = "20 KG"
        XCTAssertEqual(weight, expectedWeight, "Wronh weight")
        
        // height
        let height = pokemonVM.height
        let expectedHeight = "3 M"
        XCTAssertEqual(height, expectedHeight, "Wronh height")
        
        // name
        let name = pokemonVM.name
        let expectedName = "spearow"
        XCTAssertEqual(name, expectedName, "Wrong name")
        
        // types
        let types = pokemonVM.types
        let expectedType: [PokeType] = [.normal, .flying]
        XCTAssertEqual(types, expectedType, "Wrong type")
        
        // gradient
        let gradient = pokemonVM.gradient
        let expectedGradient: [Color] = [Color.init(PokeType.normal.rawValue), Color.init(PokeType.flying.rawValue)]
        XCTAssertEqual(gradient, expectedGradient, "Wrong gradient")
        
        // pokedexNumber
        let pokedexNumber = pokemonVM.pokedexNumber
        let expetedPokedexNumner = "#021"
        XCTAssertEqual(pokedexNumber, expetedPokedexNumner, "Wrong pokedex number")
        
        // imageUrlFrom
        let imageUrlFrom = pokemonVM.imageUrlFrom()
        let expectedUrl = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/21.png")
        XCTAssertEqual(imageUrlFrom, expectedUrl, "Wrong url")
    }
}
