//
//  NetworkProvider.swift
//  TVMovie
//
//  Created by Daehoon Lee on 2024/02/26.
//

import Foundation

final class NetworkProvider {
    private let endpoint: String
    
    init() {
        self.endpoint = "https://api.themoviedb.org/3"
    }
    
    func makeTVNetwork() -> TVNetwork {
        let network = Network<TVListModel>(endpoint)
        
        return TVNetwork(network: network)
    }
    
    func makeMovieNetwork() -> MovieNetwork {
        let network = Network<MovieListModel>(endpoint)
        
        return MovieNetwork(network: network)
    }
}
