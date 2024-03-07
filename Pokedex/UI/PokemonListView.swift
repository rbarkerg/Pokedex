//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Reggie Barker on 6/3/24.
//

import SwiftUI

struct PokemonListView: View {
    
    @ObservedObject var viewModel = PokemonListViewModel()
    @State private var showToast = true
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.curentData) { pokemon in
                    NavigationLink {
                        PokemonDetailView(model: pokemon)
                    } label: {
                        AsyncImage(url: viewModel.imageUrlFrom(pokemon: pokemon)) { phase in
                            switch phase {
                            case .success(let image):
                                image.resizable()
                            default:
                                ProgressView()
                            }
                        }.aspectRatio(contentMode: .fit)
                        
                        Text(pokemon.name)
                    }
                    .frame(height: 80, alignment: .center)
                    .onAppear { viewModel.loadMoreData(item: pokemon) }
                    
                }
                .scrollContentBackground(.hidden)
                .background(Color.white)
                .navigationBarTitle(Text("AppName"), displayMode: .automatic)
                .toolbarBackground(Color.pink, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            .tint(.white)
            .alert(isPresented: $viewModel.showErrorAler, content: {
                Alert(title: Text("Error"))
            })
            
            switch viewModel.state {
            case .loading:
                Loading()
            default:
                EmptyView()
            }
        }.onAppear { viewModel.getData() }
    }
}

#Preview {
    PokemonListView()
}

