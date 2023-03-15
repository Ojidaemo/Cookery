//
//  ListSection.swift
//  Cookery
//
//  Created by Vitali Martsinovich on 2023-03-13.
//

import Foundation

// перечисляем секции
enum ListSection {
    case category([ListItem])
    case example([ListItem])
    
    // чтобы понять сколько айтемов в каждой секции
    var items: [ListItem] {
        //перебираем возможные секции
        switch self {
        case .category(let items),
                .example(let items):
            return items
        }
    }
    
    //определяем количество секций
    var count: Int {
        items.count
    }
    
    //определяем название секций
    var title: String {
        switch self {
        case .category(_):
            return "Category"
        case .example(_):
            return "Example"
        }
    }
}
