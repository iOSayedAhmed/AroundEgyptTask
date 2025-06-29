//
//  HomeInteractor.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

struct HomeInteractor {
    private let getRecommendedExperiencesUseCase = GetRecommendedExperiencesUseCase()
    private let getRecentExperiencesUseCase = GetRecentExperiencesUseCase()
    private let searchExperiencesUseCase = SearchExperiencesUseCase()
    private let likeExperienceUseCase = LikeExperienceUseCase()

    func fetchRecommendedExperiences() async -> Result<[Experience], Error> {
        await getRecommendedExperiencesUseCase.execute()
    }

    func fetchRecentExperiences() async -> Result<[Experience], Error> {
        await getRecentExperiencesUseCase.execute()
    }

    func searchExperinces(with title: String) async -> Result<[Experience], Error> {
        await searchExperiencesUseCase.execute(with: title)
    }

    func likeExperince(with id: String) async -> Result<Int, Error> {
        await likeExperienceUseCase.execute(with: id)
    }
}
