//
//  SearchBarView.swift
//  interview-task
//
//  Created by Lenard Pop on 13/08/2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @State private var isEditing = false

    var enableSubmit: Bool = false
    var onSubmit: () -> Void = {}

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search",
                          text: $searchText,
                          onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                })
                .onSubmit {
                    onSubmit()
                }
                .foregroundColor(.primary)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(4)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray, lineWidth: 1)
            )

            if enableSubmit && isEditing && !searchText.isEmpty {
                Button(action: { onSubmit() }) {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                        .foregroundColor(.black)
                }
                .frame(width: 20, height: 20)
            }
        }
    }
}
