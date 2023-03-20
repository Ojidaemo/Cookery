//
//  RecipeTypesData.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-18.
//

import Foundation

// MARK: - RecipeData
struct RecipeTypesData: Codable {
    let results: [Result]?
    let offset, number, totalResults: Int?
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let imageType: ImageType?
}

enum ImageType: String, Codable {
    case jpg = "jpg"
}
