//
//  SharedExperienceStateManager.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation
import Combine

final class SharedExperienceStateManager: ObservableObject {
    static let shared = SharedExperienceStateManager()
    
    private let likeUpdateSubject = PassthroughSubject<(String, Int), Never>()
    
    private init() {}
    
    var likeUpdates: AnyPublisher<(String, Int), Never> {
        likeUpdateSubject.eraseToAnyPublisher()
    }
    
    func updateLikeCount(for experienceId: String, newCount: Int) {
        likeUpdateSubject.send((experienceId, newCount))
    }
}
