//
//  ExperiencesRepositoryProtocol.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

protocol ExperiencesRepositoryProtocol {
    func getRecommendedExperiences() async -> Result<ExperiencesResponse, Error>
    func getRecentExperiences() async -> Result<ExperiencesResponse, Error>
    func searchExperinces(with title: String) async -> Result<ExperiencesResponse, Error>
    func likeExperince(with id: String) async -> Result<LikesResponse, Error>
    func getSingleExperince(with id: String) async -> Result<SingleExperienceResponse, Error>
}
