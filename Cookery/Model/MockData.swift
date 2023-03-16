//
//  MockData.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-13.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    // хардкодим заголовки \ картинки, но может из сети
    
    var categories = ["all", "side dish", "dessert", "appetizer", "salad", "bread", "breakfast", "soup", "beverage", "sauce", "marinade", "fingerfood", "snack", "drink"]
    
    private let category: ListSection = {
        .category([
            .init(title: "All", image: "all"),
            .init(title: "Side dish", image: "categoryImage"),
            .init(title: "Dessert", image: "categoryImage"),
            .init(title: "Appetizer", image: "categoryImage"),
            .init(title: "Salad", image: "salad"),
            .init(title: "Bread", image: "categoryImage"),
            .init(title: "Breakfast", image: "categoryImage"),
            .init(title: "Soup", image: "soup"),
            .init(title: "Sauce", image: "categoryImage"),
            .init(title: "Marinade", image: "categoryImage"),
            .init(title: "Snack", image: "categoryImage"),
            .init(title: "Drink", image: "drinks"),
            .init(title: "Fingerfood", image: "fingerfood")
        ])
    }()
    
    private let example: ListSection = {
        .recipe([
            .init(title: "", image: "foodImage"),
            .init(title: "", image: "foodImage"),
            .init(title: "", image: "foodImage"),
            .init(title: "", image: "foodImage"),
            .init(title: "", image: "foodImage"),
            .init(title: "", image: "foodImage"),
            .init(title: "", image: "foodImage")
            ])
    }()
    
    // массив секций, которые создаем выше
    var pageData: [ListSection] {
        [category, example]
    }
}
