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
    private let sales: ListSection = {
        .sales([
            .init(title: "", image: "salesBurger"),
            .init(title: "", image: "salesBurger2"),
            .init(title: "", image: "salesBurger")
            ])
    }()
    
    private let category: ListSection = {
        .category([
            .init(title: "Burger", image: "categoryImage"),
            .init(title: "Burger", image: "categoryImage"),
            .init(title: "Burger", image: "categoryImage"),
            .init(title: "Burger", image: "categoryImage"),
            .init(title: "Burger", image: "categoryImage"),
            .init(title: "Burger", image: "categoryImage")
        ])
    }()
    
    private let example: ListSection = {
        .example([
            .init(title: "", image: "foodImage"),
            .init(title: "", image: "foodImage"),
            .init(title: "", image: "foodImage")
            ])
    }()
    
    // массив секций, которые создаем выше
    var pageData: [ListSection] {
        [sales, category, example]
    }
}
