//
//  NewsDetailsModel.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 27/06/2023.
//

import Foundation
import Combine
import NewsApi23

class NewsDetailsModel: ObservableObject {
    @Published private(set) var article: Article
    
    init(article: Article) {
        self.article = article
    }
}
