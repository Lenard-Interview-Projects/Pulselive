//
//  SearchView.swift
//  interview-task
//
//  Created by Lenard Pop on 13/08/2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel

    init(searchQuery: String) {
        _viewModel = StateObject(wrappedValue: SearchViewModel(query: searchQuery))
    }

    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.searchQuery)
                .padding(.horizontal, 16)
                .padding(.top, 32)
                .padding(.bottom, 16)

            ScrollView(viewModel.isLoading || viewModel.isEmpty ? [] : .vertical) {
                LazyVStack {
                    if viewModel.isEmpty && !viewModel.isLoading {
                        Image("no_articles")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 64)
                            .frame(maxWidth: .infinity)
                    }

                    if viewModel.isLoading {
                        ForEach(0..<2, id:\.self) { _ in
                            SearchItemView(item: ItemViewModel())
                                .redacted(reason: .placeholder)
                        }
                    } else {
                        ForEach(viewModel.articles, id:\.id) { item in
                            NavigationLink(destination: DetailsView(id: item.id)) {
                                SearchItemView(item: item)
                            }
                        }
                    }
                }
                .padding(.horizontal, 32)
            }
        }
        .background(content: {
            RoundedRectangle(cornerRadius: 0)
                .fill(Color("BackgroundSecondary"))
                .cornerRadius(50, corners: [.topLeft])
                .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
                .offset(x: 100, y: 100)
        })
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            NavigationToolbarContent(hideBurger: true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchQuery: "")
    }
}
