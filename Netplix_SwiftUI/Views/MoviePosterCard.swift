//
//  MoviePosterCard.swift
//  Netplix_SwiftUI
//
//  Created by Farendza Muda on 24/11/22.
//

import SwiftUI

struct MoviePosterCard: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack{
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .shadow(radius: 4)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .shadow(radius: 4)
                
                Text(movie.title)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width: 203, height: 306)
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.posterURL)
        }
    }
}

struct MoviePosterCard_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCard(movie: Movie.stubbedMovie)
    }
}
