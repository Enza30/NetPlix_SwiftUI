//
//  MoviesBackdropCard.swift
//  Netplix_SwiftUI
//
//  Created by Farendza Muda on 24/11/22.
//

import SwiftUI

struct MoviesBackdropCard: View {
    
    let movie : Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            
            Text(movie.title)
                .multilineTextAlignment(.center)
        }
        .lineLimit(1)
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }
    }
}

struct MoviesBackdropCard_Previews: PreviewProvider {
    static var previews: some View {
        MoviesBackdropCard(movie: Movie.stubbedMovie)
    }
}
