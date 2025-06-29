//
//  ExperienceDetailsInteractor.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

struct ExperienceDetailsInteractor {
    private let getSingleExperienceUseCase = GetSingleExperienceUseCase()
    private let likeExperienceUseCase = LikeExperienceUseCase()

    func fetchSingleExperience(with id: String) async -> Result<Experience, Error> {
        await getSingleExperienceUseCase.execute(with: id)
    }

    func likeExperince(with id: String) async -> Result<Int, Error> {
        await likeExperienceUseCase.execute(with: id)
    }
}
