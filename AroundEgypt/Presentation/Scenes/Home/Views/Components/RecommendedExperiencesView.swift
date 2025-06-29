//
//  RecommendedExperiencesView.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import SwiftUI

struct RecommendedExperiencesView: View {
    let onSelectExperience: (String) -> Void
    let onLikeExperience: (String) -> Void
    @Binding var experinces: [Experience]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(TextConstants.recommendedExperiences)
                .font(.title2.bold())
                .foregroundColor(.black)
                .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(experinces) { experience in
                        ExperienceCardView(
                            experience: experience,
                            onSelectExperience: onSelectExperience,
                            onLikeExperience: onLikeExperience
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    RecommendedExperiencesView(
        onSelectExperience: {_ in},
        onLikeExperience: {_ in},
        experinces:
            .constant(
                [
                    .previewList[0],
                    .previewList[1],
                    .previewList[2],
                ]
            )
    )
}
