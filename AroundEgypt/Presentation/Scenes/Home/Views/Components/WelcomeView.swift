//
//  WelcomeView.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//


//
//  WelcomeView.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(TextConstants.welcomeTitle)
                .font(.title2.bold())
                .foregroundColor(.black)

            Text(TextConstants.welcomeDetails)
            .font(.body)
            .foregroundColor(.black)
        }
        .padding(.horizontal)
    }
}

#Preview {
    WelcomeView()
}