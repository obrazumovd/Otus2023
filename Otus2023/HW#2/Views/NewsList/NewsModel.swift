//
//  NewsModel.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 26/06/2023.
//

import Foundation
import NewsApi23

final class NewsModel: ObservableObject {
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
        ArticlesAPI.everythingGet(q: selectedCategory.query,
                                  from: Date().addingDay(-1).dateForNews(),
                                  sortBy: "publishedAt",
                                  language: "en",
                                  apiKey: "1c3a1d04cc674ddaa897818225da2afe",
                                  page: page) { [weak self] data, error in
            guard let self = self else { return }
            debugPrint(error ?? "noError")
            self.article.append(contentsOf: data?.articles ?? [])
            self.totalPages = Int((Double(data?.totalResults ?? 1) / 100).rounded(.up))
            self.canLoad = true
        }
    }
}
