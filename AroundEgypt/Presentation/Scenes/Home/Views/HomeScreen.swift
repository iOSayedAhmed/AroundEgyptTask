//
//  HomeScreen.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            Group {
                HeaderView(onSubmit: viewModel.search(with:))
                ZStack {
                    homeView()
                    if viewModel.isLoading {
                        Color.white
                            .edgesIgnoringSafeArea(.all)
                        ProgressView()
                    }
                }
            }
            .padding(.top)
            .onViewDidLoad {
                await viewModel.viewDidLoad()
            }
            .errorAlert(error: $viewModel.error)
        }
        .sheet(item: $viewModel.selectedID) { selectedID in
            ExperienceDetailsScreen(
                viewModel: ExperienceDetailsViewModel(
                    selectedID: selectedID.value,
                    delegate: viewModel
                )
            )
        }
    }
}

private extension HomeScreen {
    func homeView() -> some View {
        ScrollView {
            VStack(spacing: 20) {
                if viewModel.isSearching {
                    if viewModel.filteredExperiences.isEmpty {
                        Text(TextConstants.noResults)
                            .font(.title.bold())
                            .padding()
                    } else {
                        ExperiencesListView(
                            onSelectExperience: viewModel.didSelectExperience(with:),
                            onLikeExperience: viewModel.likeExperince(with:),
                            experinces: $viewModel.filteredExperiences
                        )
                    }
                } else {
                    WelcomeView()
                    RecommendedExperiencesView(
                        onSelectExperience: viewModel.didSelectExperience(with:),
                        onLikeExperience: viewModel.likeExperince(with:),
                        experinces: $viewModel.recommendedExperiences
                    )
                    VStack(alignment: .leading, spacing: 10) {
                        Text(TextConstants.mostRecent)
                            .font(.title2.bold())
                            .foregroundColor(.black)
                            .padding(.leading)
                        ExperiencesListView(
                            onSelectExperience: viewModel.didSelectExperience(with:),
                            onLikeExperience: viewModel.likeExperince(with:),
                            experinces: $viewModel.recentExperiences
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    HomeScreen(viewModel: HomeViewModel())
}
