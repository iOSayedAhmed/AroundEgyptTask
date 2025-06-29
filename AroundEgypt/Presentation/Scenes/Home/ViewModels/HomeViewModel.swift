//
//  HomeViewModel.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var recommendedExperiences: [Experience] = []
    @Published var recentExperiences: [Experience] = []
    @Published var filteredExperiences: [Experience] = []
    @Published var selectedID: IdentifiableString?
    @Published var isLoading: Bool = true
    @Published var isSearching: Bool = false
    @Published var error: Error?

    private let interactor = HomeInteractor()

    @MainActor
    func viewDidLoad() async {
        async let recommendedExperiences: () = fetchRecommendedExperiences()
        async let recentExperiences: () = fetchRecentExperiences()
        _ = await (recommendedExperiences, recentExperiences)
        isLoading = false
    }

    func search(with title: String) {
        isSearching = !title.isEmpty
        guard !title.isEmpty else {
            filteredExperiences.removeAll()
            return
        }
        Task { @MainActor in
            isLoading = true
            let result = await interactor.searchExperinces(with: title)
            isLoading = false
            switch result {
                case .success(let experiences):
                    filteredExperiences = experiences
                case .failure(let error):
                    self.error = error
            }
        }
    }

    func likeExperince(with id: String) {
        Task { @MainActor in
            let result = await interactor.likeExperince(with: id)
            switch result {
                case .success(let newLikesCount):
                    if let index = recommendedExperiences.firstIndex(where: { $0.id == id }) {
                        recommendedExperiences[index].likes = newLikesCount
                    }
                    if let index = recentExperiences.firstIndex(where: { $0.id == id }) {
                        recentExperiences[index].likes = newLikesCount
                    }
                case .failure(let error):
                    self.error = error
            }
        }
    }

    func didSelectExperience(with id: String) {
        selectedID = IdentifiableString(id)
    }
}

private extension HomeViewModel {
    @MainActor
    func fetchRecommendedExperiences() async {
        let result = await interactor.fetchRecommendedExperiences()
        switch result {
            case .success(let experiences):
                recommendedExperiences = experiences
            case .failure(let error):
                self.error = error
        }
    }

    @MainActor
    func fetchRecentExperiences() async {
        let result = await interactor.fetchRecentExperiences()
        switch result {
            case .success(let experiences):
                recentExperiences = experiences
            case .failure(let error):
                self.error = error
        }
    }
}
