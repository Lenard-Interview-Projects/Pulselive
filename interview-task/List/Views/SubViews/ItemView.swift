//
//  ItemView.swift
//  interview-task
//
//  Created by Lenard Pop on 13/08/2023.
//

import SwiftUI
import interview_services

struct ItemView: View {
    @ObservedObject var viewModel: ItemViewModel

    init(viewModel: ItemViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack (alignment: .leading) {
            Text(viewModel.title)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.bottom, 8)
                .foregroundColor(.black)

            Text(viewModel.subtitle)
                .font(.body)
                .lineLimit(3)
                .padding(.bottom, 8)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)

            Spacer()
            
            Text(String.init(describing: viewModel.date.toFriendlyDateLong()))
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: 100, height: 150)
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.black, lineWidth: 1)
                .background(Color.white)
        )
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(viewModel: ItemViewModel())
    }
}
