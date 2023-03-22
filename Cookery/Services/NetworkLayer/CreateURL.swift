//
//  CreateURL.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-17.
//

import Foundation

enum CreateURL {
//    case randomURL(apiKey: String)
    case categoryURL(apiKey: String, type: String)
    case detailedURL(apiKey: String, id: Int)
    case searchURL(apiKey: String, keyWord: String)
}

extension CreateURL {
    
    var url: URL {
        switch self {
//        case .randomURL(let apiKey):
//            if let url = URL(string: "https://api.spoonacular.com/recipes/random?apiKey=\(apiKey)&number=10") {
//                return url
//            }
//            fatalError()
        case .categoryURL(let apiKey, var type):
            type = type.replacingOccurrences(of: " ", with: "+")
            if let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?type=\(type)&apiKey=\(apiKey)&number=30") {
                return url
            }
            fatalError()
        case .detailedURL(let apiKey, var id):
            if let url = URL(string: "https://api.spoonacular.com/recipes//\(id)/information?apiKey=\(apiKey)") {
                return url
            }
            fatalError()
        case .searchURL(let apiKey, var keyWord):
            if let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?query=\(keyWord)&apiKey=\(apiKey)") {
                return url
            }
            fatalError()
        }
    }
}
