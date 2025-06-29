//
//  ExperienceDetailsInteractor.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

struct ExperienceDetailsInteractor {
    private let repository: ExperiencesRepositoryProtocol

    init(repository: ExperiencesRepositoryProtocol = ExperiencesRepositoryImpl()) {
        self.repository = repository
    }

    func getSingleExperience(with id: String) async -> Result<Experience, Error> {
        let result = await repository.getSingleExperince(with: id)
        switch result {
        case .success(let response):
            let experience = Experience(
                id: response.data.id,
                imagePath: response.data.imagePath,
                title: response.data.title,
                views: response.data.views,
                likes: response.data.likes,
                isRecommended: false
            )
            return .success(experience)
        case .failure(let error):
            return .failure(error)
        }
    }
}
