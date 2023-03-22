//
//  RecipesManager.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-17.
//

import Foundation

struct RecipesManager {
    
    let key = ApiKeys.key.rawValue
    
    
    //MARK: - Request for popular recipes
//    func randomRequest(completionHandler: @escaping (RecipeData) -> Void) {
//        let url = CreateURL.randomURL(apiKey: key).url
//        print("random \(url)")
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            if let randomData = data {
//                let decoder = JSONDecoder()
//                do {
//                    let decodedRandomRecipes = try decoder.decode(RecipeData.self, from: randomData)
//                    completionHandler(decodedRandomRecipes)
//                } catch let error {
//                    print(error)
//                }
//            }
//        }
//        task.resume()
//    }
    
    //MARK: - Request for recipes by categories
    
    func categoriesRequest(for type: String, completionHandler: @escaping (RecipeTypesData) -> Void) {
        let url = CreateURL.categoryURL(apiKey: key, type: type).url
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let categoriesData = data {
                let decoder = JSONDecoder()
                do {
                    let decodedCategoriesRecipes = try decoder.decode(RecipeTypesData.self, from: categoriesData)
                    completionHandler(decodedCategoriesRecipes)
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    //MARK: - Request for details by id
    
    func detailsRequest(for id: Int, completionHandler: @escaping (Recipe) -> Void) {
        let url = CreateURL.detailedURL(apiKey: key, id: id).url
        print("details \(url)")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let detailsData = data {
                let decoder = JSONDecoder()
                do {
                    let decodedDetailsData = try decoder.decode(Recipe.self, from: detailsData)
                    completionHandler(decodedDetailsData)
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    //MARK: - Request for search results by keyword
    func searchRequest(for keyWord: String, completionHandler: @escaping (RecipeTypesData) -> Void) {
        let url = CreateURL.searchURL(apiKey: key, keyWord: keyWord).url
        print("search \(url)")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let searchData = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedSearchData = try decoder.decode(RecipeTypesData.self, from: searchData)
                        completionHandler(decodedSearchData)
                    } catch let error {
                        print(error)
                    }
                }
            }
        task.resume()
    }
}
                                     
                                     
                                     
                                     
