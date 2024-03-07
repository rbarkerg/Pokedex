//
//  ViewModelState.swift
//  Pokedex
//
//  Created by Reggie Barker on 5/3/24.
//

import Foundation

/// A list of view model's states
enum ViewModelState {
    case idle
    case loading
    case error(error: String)
}
