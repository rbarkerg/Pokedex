//
//  Loading.swift
//  Pokedex
//
//  Created by Reggie Barker on 6/3/24.
//

import SwiftUI

struct Loading: View {
    var body: some View {
        ZStack {
            LottieView(loopMode: .loop).padding(EdgeInsets.init(top: 100, leading: 80, bottom: 100, trailing: 80))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.5))
    }
}

#Preview {
    Loading()
}
