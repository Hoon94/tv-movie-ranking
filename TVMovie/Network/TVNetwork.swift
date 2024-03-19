//
//  TVNetwork.swift
//  TVMovie
//
//  Created by Daehoon Lee on 2024/02/26.
//

import Foundation
import RxSwift

final class TVNetwork {
    private let network: Network<TVListModel>
    
    init(network: Network<TVListModel>) {
        self.network = network
    }
    
    func getTopRatedList() -> Observable<TVListModel> {
        return network.getItemList(path: "/tv/top_rated")
    }
}
