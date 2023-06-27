//
//  NewsDetailsView.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 27/06/2023.
//

import SwiftUI
import NewsApi23

struct NewsDetailsView: View, ItemView {
    var listener: INavigationContainer?
    
    @ObservedObject var newsDetailsModel: NewsDetailsModel
    
    var body: some View {
        VStack(alignment: .leading) {
            backButton()
            articlePage()
        }
        .padding(.horizontal)
    }
}

private extension NewsDetailsView {
    func backButton() -> some View {
        Button(action: { listener?.pop() }) {
            Text("Back")
        }
        .padding(.bottom)
    }
    func articlePage() -> some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(newsDetailsModel.article.title ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                AsyncImage(url: URL(string: newsDetailsModel.article.urlToImage ?? "")) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    Image(systemName: "photo.artframe")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray.opacity(0.3))
                }
                .frame(maxWidth: geometry.size.width - 40)
                .cornerRadius(10)
                Text(newsDetailsModel.article.content ?? "")
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct NewsDetails_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailsView(newsDetailsModel: NewsDetailsModel(article: Article(source: nil, author: "source", title: "Title", description: "description", url: "url", urlToImage: "urlToImage", publishedAt: "2020-11-23", content: "content")))
    }
}
