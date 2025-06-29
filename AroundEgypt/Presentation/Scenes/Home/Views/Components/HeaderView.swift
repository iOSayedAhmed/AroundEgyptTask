//
//  HeaderView.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import SwiftUI

struct HeaderView: View {
    @State private var searchText: String = ""
    let onSubmit: (String) -> Void

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "line.horizontal.3")
                .resizable()
                .scaledToFit()
                .frame(width: 18)
                .foregroundColor(.black)

            searchBar()

            Image(systemName: "slider.horizontal.3")
                .resizable()
                .scaledToFit()
                .frame(width: 18)
                .foregroundColor(.black)
        }
        .padding(.horizontal)
    }
}

private extension HeaderView {
    func searchBar() -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("Try Luxor", text: $searchText)
                .foregroundColor(.black)
                .frame(height: 20)
                .onSubmit {
                    onSubmit(searchText)
                }
        }
        .padding(10)
        .background(.searchBar.opacity(0.12))
        .cornerRadius(10)
    }
}

#Preview {
    HeaderView(onSubmit: {_ in})
}
