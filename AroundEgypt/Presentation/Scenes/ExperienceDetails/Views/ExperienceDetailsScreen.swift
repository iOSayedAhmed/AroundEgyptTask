//
//  ExperienceDetailsScreen.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import SwiftUI

struct ExperienceDetailsScreen: View {
    @StateObject var viewModel: ExperienceDetailsViewModel

    var body: some View {
        Text("Experience Details Screen")
            .navigationTitle("Details")
    }
}

#Preview {
    ExperienceDetailsScreen(viewModel: ExperienceDetailsViewModel(selectedID: "1"))
}
