//
//  NewsList.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 26/06/2023.
//

import SwiftUI
import NewsApi23

struct NewsList: View, ItemView {
    @StateObject var model: NewsModel = .init()
    var listener: INavigationContainer?
    
    private let size = UIScreen.main.bounds.size
    @State var isAnimateSelected: Bool = false
    @State var selected: Article?
    @State var selectedPosition = CGRect()
    
    var body: some View {
        mainView
    }
}

private extension NewsList {
    var mainView: some View {
        VStack {
            categoryPicker
            listView
        }
    }
    
    var listView: some View {
        guard model.article.count > 0 else {
            return VStack {
                Spacer()
                Text("No results")
                Spacer()
            }.toAnyView()
        }
        return ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(Array(model.article.enumerated()), id:\.offset) { index, article in
                        let isElementLast = model.article.isLast(article)
                        GeometryReader { geometry in
                            cell(article: article)
                                .onAppear {
                                    if model.canLoad && isElementLast {
                                        model.nextPage()
                                    }
                                }
                                .onTapGesture {
                                    Task {
                                        isAnimateSelected = false
                                        selected = article
                                        selectedPosition = geometry.frame(in: .global)
                                        print("selectedPosition = \(selectedPosition.midY)")
                                        withAnimation (
                                            Animation.linear(duration: 0.5)) {
                                                isAnimateSelected = true
                                            }
                                        try await Task.sleep(nanoseconds: 500_000_000_)
                                        guard selected == article else { return }
                                        listener?.push(view: NewsDetailsView(newsDetailsModel: NewsDetailsModel(article: article)))
                                    }
                                }
                        }
                        .frame(height: 80)
                        
                        .progressBar(isLoading: !model.canLoad && isElementLast)
                    }
                }
                .padding(.horizontal)
            }
                cell(article: selected)
                    .frame(width: selectedPosition.width, height: selectedPosition.height)
                    .scaleEffect(isAnimateSelected ? 0.1 : 1)
                    .modifier(FavoriteEffect(isOn: isAnimateSelected,
                                             offsetX: isAnimateSelected ? 150 : 0,
                                             offsetY: isAnimateSelected ? size.height - selectedPosition.midY : 0))
                    .position(x: selectedPosition.midX,
                              y: selectedPosition.midY - 50)
            
        }.toAnyView()
    }
    
    var categoryPicker: some View {
        let categoryBinding = Binding(get: { model.selectedCategory },
                                      set: { model.selectCategory($0) })
        return Picker("News category", selection: categoryBinding) {
            ForEach(NewsCategory.allCases, id:\.self) {
                Text($0.label)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
        .toAnyView()
    }
    
    func cell(article: Article?) -> some View {
        guard let article = article else {
            return EmptyView().toAnyView()
        }
        return HStack {
            AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "photo.artframe")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.gray.opacity(0.3))
            }
            .frame(width: 70, height: 70)
            .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(article.title ?? "no title")
                    .font(.caption)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Text(article.content ?? "no content")
                    .font(.caption2)
            }
        }
        .background(Color.white)
        .toAnyView()
    }
}


struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationContainer {
            NewsList()
        }
    }
}



