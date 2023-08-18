//
//  ItemDetailsViewModel.swift
//  interview-task
//
//  Created by Lenard Pop on 13/08/2023.
//

import Foundation
import interview_services

class ItemDetailsViewModel: ObservableObject {
    var id: Int = 0
    var title: String = ""
    var subtitle: String = ""
    var body: String = ""
    var date: Date = Date()

    init(item: ItemDetailsModel) {
        self.id = item.id
        self.title = item.title
        self.subtitle = item.subtitle
        self.body = item.body
        self.date = DateFormatter().date(from: item.date) ?? Date()
    }

    convenience init() {
        self.init(item: ItemDetailsModel(id: 0, title: "", subtitle: "", body: "", date: ""))

        self.id = 0
        self.title = "Title"
        self.subtitle = "Subtitle"
        self.body = "Subtitle"
        self.date = Date()
    }
}
