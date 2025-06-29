//
//  LikeExperienceUseCase.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

struct LikeExperienceUseCase {
    private let repository: ExperiencesRepositoryProtocol

    init(repository: ExperiencesRepositoryProtocol = ExperiencesRepositoryImpl()) {
        self.repository = repository
    }

    func execute(with id: String) async -> Result<Int, Error> {
        let result = await repository.likeExperince(with: id)
        switch result {
        case .success(let response):
            return .success(response.data)
        case .failure(let error):
            return .failure(error)
        }
    }
}
