//
//  UtilTests.swift
//  PokedexTests
//
//  Created by Reggie Barker on 7/3/24.
//

import XCTest

final class UtilTests: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testStringExtension() throws {
        let value = "Error"
        let expectedValue = "Something went wrong"
        XCTAssertEqual(value.localization(), expectedValue, "Wrong value")
        
        XCTAssertNotEqual(value, expectedValue, "Equal value")
    }

    func testFileReaderPerformance() throws {
        let pokemonMock = Pokemon.mock()
        
        let name = pokemonMock.name
        let blankValuer = ""
        XCTAssertNotEqual(name, blankValuer, "Blank name")
        
        let url = pokemonMock.url
        XCTAssertNotEqual(url, blankValuer, "Blank url")
       
    }

}
