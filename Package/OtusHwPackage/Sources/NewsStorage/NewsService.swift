//
//  NewsService.swift
//  
//
//  Created by Dmitriy Obrazumov on 12/11/2023.
//

import Foundation

public final class NewsService {
    public init() {
        debugPrint("NewsService init")
    }
}

extension NewsService: NewsServiceProtocol {
    public func getNews(category: String, from: String, page: Int, completionHandler: @escaping (_ articles: [Article], _ totalResults: Int) -> Void) {
        ArticlesAPI.everythingGet(q: category,
                                  from: from,
                                  sortBy: "publishedAt",
                                  language: "en",
                                  apiKey: "1c3a1d04cc674ddaa897818225da2afe",
                                  page: page) { data, error in
            debugPrint(error ?? "noError")
            completionHandler(data?.articles ?? [], data?.totalResults ?? 0)
        }
    }
    
    
}
