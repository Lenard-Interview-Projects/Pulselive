//
//  SearchItemView.swift
//  interview-task
//
//  Created by Lenard Pop on 14/08/2023.
//

import SwiftUI

struct SearchItemView: View {
    var item: ItemViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(item.title)
                .font(.title)
                .padding(.bottom, 16)
                .foregroundColor(Color.black)

            HStack {
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color.black)

                Text(item.date.toFriendlyDateLong())
                    .font(.body)
                    .foregroundColor(Color.black)
            }

            HStack {
                Image(systemName: "note.text")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color.black)

                Text(item.subtitle)
                    .font(.body)
                    .lineLimit(2)
                    .foregroundColor(Color.black)
            }

            Divider()
                .padding(.top, 16)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView(item: ItemViewModel())
    }
}
