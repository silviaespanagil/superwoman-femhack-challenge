//
//  SavedLottieView.swift
//  Superwoman
//
//  Created by Silvia España on 22/1/22.
//

import SwiftUI
import Lottie

struct SavedLottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .playOnce
    
    var animationView = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<SavedLottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
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
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SavedLottieView>) {}
}
