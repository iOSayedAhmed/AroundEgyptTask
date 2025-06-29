//
//  ExperiencesRepositoryImpl.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

struct ExperiencesRepositoryImpl: ExperiencesRepositoryProtocol {
    private let networkingService = NetworkingService()
    private let cachingService = CachingService()

    func getRecommendedExperiences() async -> Result<ExperiencesResponse, Error> {
        guard let url = URL(string: NetworkConstants.Endpoints.getRecommendedExperiences) else {
            return .failure(NetworkError.invalidURL)
        }
        let request = URLRequest(url: url)
        let result: Result<ExperiencesResponse, Error> = await networkingService.request(request)
        switch result {
            case .success(let response):
                return handleSuccess(response, isRecommended: true)
            case .failure(let error):
                return handleFailure(error, isRecommended: true)
        }
    }

    func getRecentExperiences() async -> Result<ExperiencesResponse, Error> {
        guard let url = URL(string: NetworkConstants.Endpoints.getRecentExperiences) else {
            return .failure(NetworkError.invalidURL)
        }
        let request = URLRequest(url: url)
        let result: Result<ExperiencesResponse, Error> = await networkingService.request(request)
        switch result {
            case .success(let response):
                return handleSuccess(response)
            case .failure(let error):
                return handleFailure(error)
        }
    }

    func searchExperinces(with title: String) async -> Result<ExperiencesResponse, Error> {
        guard let url = URL(string: NetworkConstants.Endpoints.searchExperinces(with: title)) else {
            return .failure(NetworkError.invalidURL)
        }
        let request = URLRequest(url: url)
        return await networkingService.request(request)
    }

    func likeExperince(with id: String) async -> Result<LikesResponse, Error> {
        guard let url = URL(string: NetworkConstants.Endpoints.likeExperince(with: id)) else {
            return .failure(NetworkError.invalidURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return await networkingService.request(request)
    }

    func getSingleExperince(with id: String) async -> Result<SingleExperienceResponse, Error> {
        guard let url = URL(string: NetworkConstants.Endpoints.getSingleExperience(with: id)) else {
            return .failure(NetworkError.invalidURL)
        }
        let request = URLRequest(url: url)
        return await networkingService.request(request)
    }
}

private extension ExperiencesRepositoryImpl {
    func handleSuccess(_ response: (ExperiencesResponse), isRecommended: Bool = false) -> Result<
        ExperiencesResponse, any Error
    > {
        cachingService.clearCache(isRecommended: isRecommended)
        cachingService.cacheExperienceResponses(response.data, isRecommended: isRecommended)
        return .success(response)
    }

    func handleFailure(_ error: (any Error), isRecommended: Bool = false) -> Result<ExperiencesResponse, any Error> {
        if let error = error as? NetworkError {
            switch error {
                case .noInternetConnection:
                    if let experiences = cachingService.getCachedExperienceResponses(isRecommended: isRecommended) {
                        return .success(.init(data: experiences))
                    }
                    return .failure(error)
                default: break
            }
        }
        return .failure(error)
    }
}
