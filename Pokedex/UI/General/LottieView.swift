//
//  SwiftUIView.swift
//  Pokedex
//
//  Created by Reggie Barker on 6/3/24.
//

import SwiftUI

import Lottie

struct LottieView: UIViewRepresentable {
    
    var loopMode: LottieLoopMode = .playOnce
    var name: lotiFile = .loading
    var animationView = LottieAnimationView()
    var scale: UIView.ContentMode = .scaleAspectFit
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = LottieAnimation.named(name.rawValue)
        animationView.contentMode = scale
        animationView.loopMode = loopMode
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

extension LottieView {
    enum lotiFile: String {
        case loading
    }
}
