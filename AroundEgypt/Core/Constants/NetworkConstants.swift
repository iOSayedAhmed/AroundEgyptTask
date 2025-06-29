//
//  NetworkConstants.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

enum NetworkConstants {
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
