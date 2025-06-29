//
//  GetRecommendedExperiencesUseCase.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

struct GetRecommendedExperiencesUseCase {
    private let repository: ExperiencesRepositoryProtocol

    init(repository: ExperiencesRepositoryProtocol = ExperiencesRepositoryImpl()) {
        self.repository = repository
    }

    func execute() async -> Result<[Experience], Error> {
        let result = await repository.getRecommendedExperiences()
        switch result {
        case .success(let response):
            let experiences = response.data.map { responseModel in
                Experience(
                    id: responseModel.id,
                    imagePath: responseModel.imagePath,
                    title: responseModel.title,
                    views: responseModel.views,
                    likes: responseModel.likes,
                    isRecommended: true,
                    description: responseModel.description,
                    cityName: responseModel.city.name
                )
            }
            return .success(experiences)
        case .failure(let error):
            return .failure(error)
        }
    }
}
