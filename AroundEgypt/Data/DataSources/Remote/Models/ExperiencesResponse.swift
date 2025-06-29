//
//  ExperiencesResponse.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

// MARK: - ExperiencesResponse
struct ExperiencesResponse: Decodable {
    let data: [ExperienceResponse]
}

// MARK: - ExperienceResponse
struct ExperienceResponse: Decodable {
    let id, title: String
    let imagePath: String
    let description: String
    let views, likes: Int
    let city: City

    enum CodingKeys: String, CodingKey {
        case id, title
        case imagePath = "cover_photo"
        case description
        case views = "views_no"
        case likes = "likes_no"
        case city
    }
}

// MARK: - City
struct City: Decodable {
    let name: String
}
