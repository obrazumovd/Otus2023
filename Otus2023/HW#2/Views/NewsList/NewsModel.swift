//
//  NewsModel.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 26/06/2023.
//

import Foundation
import OtusHwPackage

final class NewsModel: ObservableObject {
    @Injected private var storage: NewsService?
    
    @Published private(set) var selectedCategory: NewsCategory = .apple
    @Published var article: [Article] = .init()
    @Published private(set) var canLoad: Bool = true
    
    private var page = 1
    private var totalPages: Int = .max
    
    
    init() {
        getNews()
    }
    
    func selectCategory(_ category: NewsCategory) {
        self.article = []
        self.selectedCategory = category
        self.page = 1
        self.totalPages = .max
        getNews()
    }
    func nextPage() {
        self.page += 1
        getNews()
    }
    private func getNews() {
        guard page <= totalPages,
              canLoad  else { return }
        canLoad = false
        storage?.getNews(category: selectedCategory.query,
                         from: Date().addingDay(-1).dateForNews(),
                         page: page) { [weak self] article, totalResults in
            guard let self = self else { return }
            self.article.append(contentsOf: article)
            self.totalPages = Int((Double(totalResults) / 100).rounded(.up))
            self.canLoad = true
        }
    }
}
