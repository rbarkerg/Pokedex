//
//  BaseViewModel.swift
//  Pokedex
//
//  Created by Reggie Barker on 5/3/24.
//

import SwiftUI
import Moya

class BaseViewModel: ObservableObject {
    @Published var state: ViewModelState = .idle
    var provider: MoyaProvider<PokeApi>
    
    init(provider: MoyaProvider<PokeApi> = PokeApiProvider) {
        self.provider = provider
    }
    
    func getData(clear: Bool = true) { }
    
}
