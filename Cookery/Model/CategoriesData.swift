//
//  MockData.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-13.
//

import UIKit

struct CategoriesData {
    
    static let shared = CategoriesData()
    
    let category: ListSection = {
        .category([
            .init(title: "Random", image: "all"),
            .init(title: "Main course", image: "Main course"),
            .init(title: "Side dish", image: "Side dish"),
            .init(title: "Dessert", image: "Dessert"),
            .init(title: "Appetizer", image: "Appetizer"),
            .init(title: "Salad", image: "Salad"),
            .init(title: "Bread", image: "Bread"),
            .init(title: "Breakfast", image: "Breakfast"),
            .init(title: "Soup", image: "Soup"),
            .init(title: "Sauce", image: "Sauce"),
            .init(title: "Marinade", image: "Marinade"),
            .init(title: "Snack", image: "Snack"),
            .init(title: "Drink", image: "Drink"),
            .init(title: "Fingerfood", image: "Fingerfood")
        ])
    }()
    
    let recipe: ListSection = {
        .recipe([
            ])
    }()
    
    // массив секций, которые создаем выше
    var pageData: [ListSection] {
        [category, recipe]
    }
}
