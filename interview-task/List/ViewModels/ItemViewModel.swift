//
//  ItemViewModel.swift
//  interview-task
//
//  Created by Lenard Pop on 13/08/2023.
//

import Foundation
import interview_services

class ItemViewModel: ObservableObject {
    var id: Int = 0
    var title: String = ""
    var subtitle: String = ""
    var date: Date = Date()

    init(item: ItemModel) {
        self.id = item.id
        self.title = item.title
        self.subtitle = item.subtitle
        self.date = DateFormatter().date(from: item.date) ?? Date()
    }

    convenience init() {
        self.init(item: ItemModel(id: 0, title: "", subtitle: "", date: ""))
        
        self.id = 0
        self.title = "Title"
        self.subtitle = "Subtitle"
        self.date = Date()
    }
}
