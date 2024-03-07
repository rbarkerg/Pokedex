//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Reggie Barker on 6/3/24.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @ObservedObject var viewModel: PokemonDetailViewModel
    @State private var showWebView = false
    
    init(model:Pokemon) {
        self.viewModel = PokemonDetailViewModel(model: model)
    }
    
    var body: some View {
                
        NavigationStack {
            ZStack(alignment: .top) {
                Background(gradient: LinearGradient(colors: viewModel.gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                
                VStack {
                    AsyncImage(url: viewModel.imageUrlFrom()) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable()
                        default:
                            ProgressView()
                        }
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 240, height: 240)
                    
                    Spacer()
                    
                    Text(viewModel.name).font(Font.system(size: 40))
                        .foregroundStyle(.white)
                        .padding(.top, 60)

                    TypesView(types: viewModel.types)
                    
                    MeasuresView(height: viewModel.height, weight: viewModel.weight)
                    
                    Button {
                        showWebView.toggle()
                    } label: {
                        VStack {
                            Image("pokeball")
                            Text("wikiDex")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                        }
                    }
                    .sheet(isPresented: $showWebView) {
                        WebView(url: URL(string: "https://www.wikidex.net/wiki/\(viewModel.name)")!)
                    }
                    Spacer()
                }
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { viewModel.getData() }
        .toolbar { Text(viewModel.pokedexNumber).foregroundStyle(.white) }
    }
}

#Preview {
    PokemonDetailView(model: Pokemon.mock())
}

/// Pink Rectangle decoration and black background
struct Background: View {
    let gradient: LinearGradient
    var body: some View {
        Color.black.opacity(0.9).ignoresSafeArea()
        
        Rectangle()
            .fill(gradient)
            .frame(height: 360)
            .clipShape(
                .rect( cornerRadius: 30))
            .ignoresSafeArea()
    }
}

/// Pokemon types
struct TypesView: View {
    let types: [PokeType]
    var body: some View {
        HStack(spacing: 50) {
            Spacer()
            ForEach(types, id: \.self) { type in
                Text(type.rawValue)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .frame(width:110, height: 40,alignment: .center)
                    .background(Color.init(type.rawValue), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    
            }
            Spacer()
        }
    }
}

/// Pokemon Measures
struct MeasuresView: View {
    let height, weight: String
    var body: some View {
        HStack {
            Spacer()
            VStack {
                
                Text(weight)
                    .font(.title)
                    .foregroundStyle(.white)
                Text("Weight").foregroundStyle(.white.opacity(0.5))
            }
            Spacer()
            VStack {
                
                Text(height)
                    .font(.title)
                    .foregroundStyle(Color.white)
                Text("Height").foregroundStyle(.white.opacity(0.5))
            }
            Spacer()
        }.padding(.vertical, 20)
    }
}
