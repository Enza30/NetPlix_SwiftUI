//
//  MovieSearchView.swift
//  Netplix_SwiftUI
//
//  Created by Farendza Muda on 24/11/22.
//

import SwiftUI

struct MovieSearchView: View {
    
    @ObservedObject var movieSearchState = MovieSearchState()
    
    
    var body: some View {
            List{
                HStack{
                    Button(action: {}) {
                        Image(systemName: "text.justify")
                    }
                    SearchBarView(placeholder: "Search Movies", text: self.$movieSearchState.query)
                        .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                }
                
                
                LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                    self.movieSearchState.search(query: self.movieSearchState.query)
                }
                
                if self.movieSearchState.movies != nil {
                    ForEach(self.movieSearchState.movies!) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            VStack(alignment: .leading){
                                Text(movie.title)
                                Text(movie.yearText)
                            }
                        }
                    }
                }
            }
            .onAppear{
                self.movieSearchState.startObserve()
            }
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
