//
//  ReviewNetwork.swift
//  TVMovie
//
//  Created by Daehoon Lee on 4/7/24.
//

import Foundation
import RxSwift

final class ReviewNetwork {
    private let network: Network<ReviewListModel>
    
    init(network: Network<ReviewListModel>) {
        self.network = network
    }
    
    func getReviewList(id: Int, contentType: ContentType) -> Observable<ReviewListModel> {
        network.getItemList(path: "/\(contentType.rawValue)/\(id)/reviews", language: "en")
    }
}
