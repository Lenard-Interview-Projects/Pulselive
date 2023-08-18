//
//  ListView.swift
//  interview-task
//
//  Created by Lenard Pop on 12/08/2023.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Over **\(viewModel.articles.count)** articles")
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 2)
                            .font(.body)

                        Text("Search\nWikipedia:")
                            .font(.system(size: 64))
                            .fontWeight(.light)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 32)

                    SearchBarView(searchText: $viewModel.searchQuery,
                                  enableSubmit: true,
                                  onSubmit: {
                            viewModel.searchQueryValid = true
                        })
                        .padding(.horizontal, 16)
                        .padding(.top, 0)
                        .padding(.bottom, 48)

                    NavigationLink(
                        destination: SearchView(searchQuery: viewModel.searchQuery),
                        isActive: $viewModel.searchQueryValid,
                        label: { EmptyView() })
                        .hidden()

                    VStack(alignment: .leading) {
                        Text("Today's featured articles")
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding(.horizontal, 16)

                        if viewModel.isReady && viewModel.articles.isEmpty {
                            Image("no_articles")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 64)
                                .frame(maxWidth: .infinity)
                        }

                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(alignment: .top, spacing: 16) {
                                if viewModel.isLoading {
                                    ForEach(0..<3, id:\.self) { _ in
                                        ItemView(viewModel: ItemViewModel())
                                            .redacted(reason: .placeholder)
                                    }
                                }
                                else {
                                    ForEach(viewModel.articles, id:\.id) { item in
                                        NavigationLink(destination: DetailsView(id: item.id)) {
                                            ItemView(viewModel: item)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        .disabled(viewModel.isLoading)
                    }
                }
                .padding(.vertical, 32)
            }
            .background(content: {
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color("BackgroundSecondary"))
                    .cornerRadius(50, corners: [.topLeft])
                    .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
                    .offset(x: 100, y: 16)
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationToolbarContent()
            }
            .onAppear {
                viewModel.fetchData()
            }
            .onDisappear {
                viewModel.cancelAnyPublishers()
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
