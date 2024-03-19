//
//  MovieNetwork.swift
//  TVMovie
//
//  Created by Daehoon Lee on 2024/02/26.
//

import Foundation
import RxSwift

final class MovieNetwork {
    private let network: Network<MovieListModel>
    
    init(network: Network<MovieListModel>) {
        self.network = network
    }
    
    func getNowPlayingList() -> Observable<MovieListModel> {
        return network.getItemList(path: "/movie/now_playing")
    }
    
    func getPopularList() -> Observable<MovieListModel> {
        return network.getItemList(path: "/movie/popular")
    }
    
    func getUpcomingList() -> Observable<MovieListModel> {
        return network.getItemList(path: "/movie/upcoming")
    }
}
