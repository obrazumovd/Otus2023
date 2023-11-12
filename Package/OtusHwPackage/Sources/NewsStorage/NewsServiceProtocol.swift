//
//  NewsServiceProtocol.swift
//
//
//  Created by Dmitriy Obrazumov on 12/11/2023.
//

import Foundation

public protocol NewsServiceProtocol: AnyObject {
    func getNews(category: String, from: String, page: Int, completionHandler: @escaping (_ articles: [Article], _ totalResults: Int) -> Void)
}
