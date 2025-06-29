//
//  ExperienceDetailsViewModel.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

final class ExperienceDetailsViewModel: ObservableObject {
    let selectedID: String

    init(selectedID: String) {
        self.selectedID = selectedID
    }
}
