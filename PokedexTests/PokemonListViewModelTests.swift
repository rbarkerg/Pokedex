//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Reggie Barker on 5/3/24.
//

import XCTest
@testable import Pokedex

final class PokemonListViewModelTests: XCTestCase {

    let pokemonListVM = PokemonListViewModel(provider: PokeApiProviderTest)
    var pokemon: Pokemon = Pokemon()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        pokemonListVM.getData()
        pokemon = pokemonListVM.curentData.first!
    }

    override func tearDownWithError() throws { }

    func testPokemonListViewModel() throws {
        
        // check data from fake api
        let currentDataCount = pokemonListVM.curentData.count
        XCTAssertEqual(currentDataCount, 20, "Current data is not completed")
        
    
        // imageUrlFrom
        let path = pokemonListVM.imageUrlFrom(pokemon: pokemon).path
        let expectedPath = "/PokeAPI/sprites/master/sprites/pokemon/21.png"
        XCTAssertEqual(path, expectedPath, "Wrong path")
        
        // url
        let url = pokemonListVM.findBy(id:pokemon.id).url
        let expectedUrl = pokemon.url
        XCTAssertEqual(url, expectedUrl, "Wrong url")
        
        // name
        let name = pokemonListVM.findBy(id:pokemon.id).name
        let expectedName = pokemon.name
        XCTAssertEqual(name, expectedName, "Wrong name")
        
        // id
        let id = pokemonListVM.findBy(id:pokemon.id).id
        let expectedId = pokemon.id
        XCTAssertEqual(id, expectedId, "Wrong name")
    }
}
