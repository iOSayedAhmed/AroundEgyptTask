//
//  GetSingleExperienceUseCase.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

struct GetSingleExperienceUseCase {
    private let repository: ExperiencesRepositoryProtocol

    init(repository: ExperiencesRepositoryProtocol = ExperiencesRepositoryImpl()) {
        self.repository = repository
    }

    func execute(with id: String) async -> Result<Experience, Error> {
        let result = await repository.getSingleExperince(with: id)
        switch result {
        case .success(let response):
            let experience = Experience(
                id: response.data.id,
                imagePath: response.data.imagePath,
                title: response.data.title,
                views: response.data.views,
                likes: response.data.likes,
                isRecommended: false,
                description: response.data.description,
                cityName: response.data.city.name
            )
            return .success(experience)
        case .failure(let error):
            return .failure(error)
        }
    }
}
