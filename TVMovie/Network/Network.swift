//
//  Network.swift
//  TVMovie
//
//  Created by Daehoon Lee on 2024/02/26.
//

import Foundation
import RxSwift
import RxAlamofire

class Network<T: Decodable> {
    private let endpoint: String
    private let queue: ConcurrentDispatchQueueScheduler
    
    init(_ endpoint: String) {
        self.endpoint = endpoint
        self.queue = ConcurrentDispatchQueueScheduler(qos: .background)
    }
    
    func getItemList(path: String, language: String = "ko") -> Observable<T> {
        let fullPath = "\(endpoint)\(path)?api_key=\(Bundle.main.apiKey)&language=\(language)"
        
        return RxAlamofire.data(.get, fullPath)
            .observe(on: queue)
            .debug()
            .map { data -> T in
                return try JSONDecoder().decode(T.self, from: data)
            }
    }
}
