//
//  BaseListViewModel.swift
//  Pokedex
//
//  Created by Reggie Barker on 5/3/24.
//

import SwiftUI

class BaseListViewModel<T: Identifiable>: BaseViewModel {
    
    @Published var curentData: [T] = []
    
    var offset = 0
    var limit = 20
    var totalDataCount = 0
    
    /// pagination handler
    /// - Parameter item: last rendered item 
    func loadMoreData(item: T) {
        if (curentData.last?.id == item.id && totalDataCount > curentData.count) {
            offset += 20
            getData(clear: false)
        }
    }
}
