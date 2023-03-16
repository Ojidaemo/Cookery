//
//  MockData.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-13.
//

import UIKit

struct CategoriesData {
    
    static let shared = CategoriesData()
        
//    var categories = ["all", "side dish", "dessert", "appetizer", "salad", "bread", "breakfast", "soup", "beverage", "sauce", "marinade", "fingerfood", "snack", "drink"]
    
    let category: ListSection = {
        .category([
            .init(title: "All", image: "Main course"),
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
    
//        .category([
//            .init(title: "All", image: UIImage(named: "Main course")!),
//            .init(title: "Side dish", image: UIImage(named: "Side dish")!),
//            .init(title: "Dessert", image: UIImage(named: "Dessert")!),
//            .init(title: "Appetizer", image: UIImage(named: "Appetizer")!),
//            .init(title: "Salad", image: UIImage(named: "Salad")!),
//            .init(title: "Bread", image: UIImage(named: "Bread")!),
//            .init(title: "Breakfast", image: UIImage(named: "Breakfast")!),
//            .init(title: "Soup", image: UIImage(named: "Soup")!),
//            .init(title: "Sauce", image: UIImage(named: "Sauce")!),
//            .init(title: "Marinade", image: UIImage(named: "Marinade")!),
//            .init(title: "Snack", image: UIImage(named: "Snack")!),
//            .init(title: "Drink", image: UIImage(named: "Drink")!),
//            .init(title: "Fingerfood", image: UIImage(named: "Fingerfood")!)
//        ])
    
//    let mealsdata: [MealTypesData] = [
//        MealTypesData(title: "Main course", image: #imageLiteral(resourceName: "Main course")),
//        MealTypesData(title: "Side dish", image: #imageLiteral(resourceName: "Side dish")),
//        MealTypesData(title: "Dessert", image: #imageLiteral(resourceName: "Dessert")),
//        MealTypesData(title: "Appetizer", image: #imageLiteral(resourceName: "Appetizer")),
//        MealTypesData(title: "Salad", image: #imageLiteral(resourceName: "Salad")),
//        MealTypesData(title: "Bread", image: #imageLiteral(resourceName: "Bread")),
//        MealTypesData(title: "Breakfast", image: #imageLiteral(resourceName: "Breakfast")),
//        MealTypesData(title: "Soup", image: #imageLiteral(resourceName: "Soup")),
//        MealTypesData(title: "Beverage", image: #imageLiteral(resourceName: "Beverage")),
//        MealTypesData(title: "Sauce", image: #imageLiteral(resourceName: "Sauce")),
//        MealTypesData(title: "Marinade", image: #imageLiteral(resourceName: "Marinade")),
//        MealTypesData(title: "Fingerfood", image: #imageLiteral(resourceName: "Fingerfood")),
//        MealTypesData(title: "Snack", image: #imageLiteral(resourceName: "Snack")),
//        MealTypesData(title: "Drink", image: #imageLiteral(resourceName: "Drink"))
//    ]
    

    
    let recipe: ListSection = {
        .recipe([
            .init(title: "", image: "foodImage"),
            .init(title: "", image: "Main course"),
            .init(title: "", image: "Main course"),
            ])
    }()
    
    // массив секций, которые создаем выше
    var pageData: [ListSection] {
        [category, recipe]
    }
}
