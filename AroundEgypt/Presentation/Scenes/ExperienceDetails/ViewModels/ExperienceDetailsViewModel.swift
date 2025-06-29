//
//  ExperienceDetailsViewModel.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

final class ExperienceDetailsViewModel: ObservableObject {
    @Published var experience: Experience = .empty
    @Published var isLoading: Bool = true
    @Published var error: Error?

    let selectedID: String
    weak var delegate: ExperienceDetailsDelegate?
    private let interactor = ExperienceDetailsInteractor()

    init(selectedID: String, delegate: ExperienceDetailsDelegate? = nil) {
        self.selectedID = selectedID
        self.delegate = delegate
    }

    @MainActor
    func viewDidLoad() async {
        let result = await interactor.fetchSingleExperience(with: selectedID)
        isLoading = false
        switch result {
        case .success(let experience):
            self.experience = experience
        case .failure(let error):
            self.error = error
        }
    }

    func likeExperince() {
        Task { @MainActor in
            let result = await interactor.likeExperince(with: selectedID)
            switch result {
            case .success(let newLikesCount):
                experience.likes = newLikesCount

                delegate?.experienceDidUpdateLikes(experienceId: selectedID, newLikesCount: newLikesCount)
            case .failure(let error):
                self.error = error
            }
        }
    }
}
