//
//  ReviewViewModel.swift
//  TVMovie
//
//  Created by Daehoon Lee on 4/7/24.
//

import Foundation
import RxSwift

final class ReviewViewModel {
    private let id: Int
    private let contentType: ContentType
    private let reviewNetwork: ReviewNetwork
    
    init(id: Int, contentType: ContentType) {
        self.id = id
        self.contentType = contentType
        let provider = NetworkProvider()
        reviewNetwork = provider.makeReviewNetwork()
    }
    
    struct Input {
        
    }
    
    struct Output {
        let reviewResult: Observable<Result<[ReviewModel], Error>>
    }
    
    func transform(input: Input) -> Output {
        let reviewResult: Observable<Result<[ReviewModel], Error>> = reviewNetwork.getReviewList(id: id, contentType: contentType).map { reviewResult in
            return .success(reviewResult.results)
        }.catch { error in
            return Observable.just(.failure(error))
        }
        
        return Output(reviewResult: reviewResult)
    }
}
