//
//  ViewModel.swift
//  TVMovie
//
//  Created by Daehoon Lee on 2024/02/27.
//

import Foundation
import RxSwift

class ViewModel {
    let disposeBag = DisposeBag()
    private let tvNetwork: TVNetwork
    private let movieNetwork: MovieNetwork
    
    init() {
        let provider = NetworkProvider()
        tvNetwork = provider.makeTVNetwork()
        movieNetwork = provider.makeMovieNetwork()
    }
    
    struct Input {
        let tvTrigger: Observable<Void>
        let movieTrigger: Observable<Void>
    }
    
    struct Output {
        let tvList: Observable<[TV]>
        let movieResult: Observable<Result<MovieResult, Error>>
    }
    
    func transform(input: Input) -> Output {
        //trigger -> 네트워크 -> Observable<T> -> VC 전달 -> VC에서 구독
        
        //tvTrigger -> Observable<Void> -> Observable<[TV]>
        let tvList = input.tvTrigger.flatMapLatest { [unowned self] _ -> Observable<[TV]> in
            //Observable<TVListModel> -> Observable<[TV]>
            return self.tvNetwork.getTopRatedList().map { $0.results }
        }
        
        let movieResult = input.movieTrigger.flatMapLatest { [unowned self] _ -> Observable<Result<MovieResult, Error>> in
            //combineLatest: Observable 1, 2, 3을 모두 합쳐서 하나의 Observable로 바꾸고 싶을때 사용
            return Observable.combineLatest(self.movieNetwork.getUpcomingList(), self.movieNetwork.getPopularList(), self.movieNetwork.getNowPlayingList()) {
                upcoming, popular, nowPlaying -> Result<MovieResult, Error> in
                    return .success(MovieResult(upcoming: upcoming, popular: popular, nowPlaying: nowPlaying))
            }.catch { error in
                print(error)
                return Observable.just(.failure(error))
            }
        }
        
        return Output(tvList: tvList, movieResult: movieResult)
    }
}
