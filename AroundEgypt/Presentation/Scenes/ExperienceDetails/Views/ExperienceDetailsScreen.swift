//
//  ExperienceDetailsScreen.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 07/12/2024.
//

import SwiftUI
import Kingfisher

struct ExperienceDetailsScreen: View {
    @StateObject var viewModel: ExperienceDetailsViewModel
    @State private var isLiked: Bool = false
    private let width = UIScreen.main.bounds.width

    var body: some View {
        Group {
            ZStack {
                detailsView()

                if viewModel.isLoading {
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    ProgressView()
                }
            }
        }.onViewDidLoad {
            await viewModel.viewDidLoad()
            isLiked = LikesCacheManager.shared.getState(for: viewModel.experience.id)
        }
        .errorAlert(error: $viewModel.error)
    }
}

private extension ExperienceDetailsScreen {
    func detailsView() -> some View {
        return ScrollView {
            VStack(alignment: .leading) {
                ZStack(alignment: .bottom) {
                    imageView()
                    gradientView()
                }

                Group {
                    infoView()

                    Color(.separator)
                        .frame(width: 341, height: 1)

                    descriptionView()
                }
                .padding(.horizontal)
            }
        }
    }

    func imageView() -> some View {
        KFImage(URL(string: viewModel.experience.imagePath))
            .resizable()
            .frame(width: width, height: 285)
            .scaledToFill()
            .overlay(alignment: .center) {
                Image(.threeSixtyIcon)
                    .resizable()
                    .frame(width: 37, height: 37)
            }
    }

    func gradientView() -> some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Color.black.opacity(1),
                    Color.clear,
                ]
            ),
            startPoint: .bottom,
            endPoint: .top
        )
        .frame(width: width, height: 95)
        .overlay(alignment: .bottomLeading) {
            HStack(spacing: 5) {
                Image(systemName: "eye.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 10)
                Text("\(viewModel.experience.views) \(TextConstants.views)")
                    .font(.body.bold())
            }
            .foregroundStyle(.white)
            .padding(.leading, 10)
            .padding(.bottom, 12)
        }
        .overlay(alignment: .bottomTrailing) {
            Image(.galleryIcon)
                .resizable()
                .scaledToFit()
                .frame(height: 16)
                .padding(.trailing, 12)
                .padding(.bottom, 12)
        }
    }

    func infoView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(viewModel.experience.title)
                    .font(.title3)
                    .bold()

                Spacer()

                Image(.shareIcon)

                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .foregroundColor(.peach)
                    .onTapGesture {
                        if !isLiked {
                            isLiked = true
                            viewModel.likeExperince()
                            LikesCacheManager.shared.likeTapped(with: viewModel.experience.id)
                        }
                    }

                Text("\(viewModel.experience.likes)")
                    .font(.body.bold())
            }

            Text((viewModel.experience.cityName) + TextConstants.egypt)
                .font(.headline)
                .foregroundColor(.gray)
        }
    }

    func descriptionView() -> some View {
        VStack(alignment: .leading) {
            Text(TextConstants.description)
                .font(.title.bold())

            Text(viewModel.experience.description )
                .font(.body.bold())
        }
    }
}

#Preview {
    ExperienceDetailsScreen(
        viewModel: ExperienceDetailsViewModel(selectedID: "12")
    )
}
