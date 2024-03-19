//
//  Const.swift
//  TVMovie
//
//  Created by Daehoon Lee on 2024/02/26.
//

import Foundation

//let APIKEY = "2053c7eeaf4fdf8e1be3b593c76488c3"

extension Bundle {
//    var apiKey: String {
//        guard let file = self.path(forResource: "TVMovieInfo", ofType: "plist") else { return "⛔️ API KEY를 가져오는데 실패하였습니다." }
//        guard let resource = NSDictionary(contentsOfFile: file) else { return "⛔️ API KEY를 가져오는데 실패하였습니다." }
////        guard let key = resource["API_KEY"] as? String else { return "⛔️ API KEY를 가져오는데 실패하였습니다." }
//        guard let key = resource.object(forKey: "API_KEY") as? String else { return "⛔️ API KEY를 가져오는데 실패하였습니다." }
//
//        return key
//    }
    
    var apiKey: String {
        guard let url = self.url(forResource: "TVMovieInfo", withExtension: "plist") else { return "⛔️ API KEY를 가져오는데 실패하였습니다." }
        guard let data = try? Data(contentsOf: url) else { return "⛔️ API KEY를 가져오는데 실패하였습니다." }
//        guard let resource = try? PropertyListSerialization.propertyList(from: data, format: nil) as? NSDictionary else { return "⛔️ API KEY를 가져오는데 실패하였습니다." }
//        guard let key = resource["API_KEY"] as? String else { return "⛔️ API KEY를 가져오는데 실패하였습니다." }
        guard let resource = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: String] else { return "⛔️ API KEY를 가져오는데 실패하였습니다." }
        guard let key = resource["API_KEY"] else { return "⛔️ API KEY를 가져오는데 실패하였습니다." }
        
        return key
    }
}
