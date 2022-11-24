//
//  ActivityIndicatorView.swift
//  Netplix_SwiftUI
//
//  Created by Farendza Muda on 24/11/22.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
}
