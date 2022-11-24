//
//  MovieListView.swift
//  Netplix_SwiftUI
//
//  Created by Farendza Muda on 24/11/22.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    @ObservedObject private var latestState = MovieListState()
    
    var body: some View {
        NavigationView{
            List{
                Group{
                    if upcomingState.movies != nil {
                        MovieBackdropCarouselView(title: "", movies: upcomingState.movies!)
                    } else {
                        LoadingView(isLoading: upcomingState.isLoading, error: upcomingState.error) {
                            self.upcomingState.loadMovies(with: .upcoming)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                Group{
                    if nowPlayingState.movies != nil {
                        MovieBackdropCarouselView(title: "Latest", movies: nowPlayingState.movies!)
                    } else {
                        LoadingView(isLoading: nowPlayingState.isLoading, error: nowPlayingState.error) {
                            self.nowPlayingState.loadMovies(with: .nowPlaying)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                Group{
                    if popularState.movies != nil {
                        MoviePosterCarouselView(title: "Popular", movies: popularState.movies!)
                    } else {
                        LoadingView(isLoading: popularState.isLoading, error: popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            }
            .navigationBarTitle("Netplix")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "text.justify")
                            .imageScale(.large)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination: MovieSearchView()) {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.large)
                        }
                    }
                }
            })
        }
        .onAppear{
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.popularState.loadMovies(with: .popular)
            self.upcomingState.loadMovies(with: .upcoming)
            self.latestState.loadMovies(with: .latest)
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
