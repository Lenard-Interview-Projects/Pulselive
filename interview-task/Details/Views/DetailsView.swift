//
//  DetailsView.swift
//  interview-task
//
//  Created by Lenard Pop on 12/08/2023.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.presentationMode) private var presentationMode

    @StateObject var viewModel: DetailsViewModel

    init(id: Int) {
        _viewModel = StateObject(wrappedValue: DetailsViewModel(id: id))
    }

    private func bodyPlaceholder() -> some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.5))
                .frame(width: 325, height: 15)

            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.5))
                .frame(width: 325, height: 15)

            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.5))
                .frame(width: 325, height: 15)

            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.5))
                .frame(width: 325, height: 15)

            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.5))
                .frame(width: 250, height: 15)

        }
        .padding(.top, 32)
    }

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(viewModel.item.title)
                    .font(.system(size: 32))
                    .fontWeight(.bold)

                HStack {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 16, height: 16)

                    Text(viewModel.item.date.toFriendlyDateLong())
                        .font(.body)
                }

                HStack {
                    Image(systemName: "note.text")
                        .resizable()
                        .frame(width: 16, height: 16)

                    Text(viewModel.item.subtitle)
                        .font(.body)
                        .lineLimit(nil)
                }

                if viewModel.isLoading {
                    bodyPlaceholder()
                } else {
                    ScrollView(showsIndicators: true) {
                        LazyVStack(alignment: .leading) {
                            Text(viewModel.item.body)
                                .font(.body)
                                .lineLimit(nil)
                        }
                        .padding(.top, 32)
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 32)
            .redacted(reason: viewModel.isLoading ? .placeholder : [])

            HStack {
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Text("Close")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }

                Spacer()

                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                        .foregroundColor(Color.black)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(16)
            .background(Color.white)
        }
        .background(alignment: .bottom, content: {
            RoundedRectangle(cornerRadius: 0)
                .fill(Color("BackgroundSecondary"))
                .cornerRadius(50, corners: [.topLeft])
                .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
                .frame(height: 450)
                .offset(x: 100, y: 150)
        })
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            NavigationToolbarContent(hideBurger: true)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(id: 0)
    }
}
