//
//  ExperienceDetailsDelegate.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

protocol ExperienceDetailsDelegate: AnyObject {
    func experienceDidUpdateLikes(experienceId: String, newLikesCount: Int)
}
