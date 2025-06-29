//
//  Constants.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

enum Constants {
    enum Network {
        static let baseURL = "https://aroundegypt.34ml.com/api/v2/"

        enum Endpoints {
            static let getRecommendedExperiences = baseURL + "experiences?filter[recommended]=true"
            static let getRecentExperiences = baseURL + "experiences"
            static func searchExperinces(with title: String) -> String {
                baseURL + "experiences?filter[title]=\(title)"
            }
            static func getSingleExperience(with id: String) -> String {
                baseURL + "experiences/\(id)"
            }
            static func likeExperince(with id: String) -> String {
                baseURL + "experiences/\(id)/like"
            }

        }
    }

    enum Text {
        static let recommended = "RECOMMENDED"
        static let welcomeTitle = "Welcome!"
        static let welcomeDetails =
            "Now you can explore any experience in 360 degrees and get all the details about it all in one place."
        static let recommendedExperiences = "Recommended Experiences"
        static let mostRecent = "Most Recent"
        static let noResults = "No Results..."
        static let description = "Description"
        static let egypt = ", Egypt."
        static let views = "views"
    }
}
