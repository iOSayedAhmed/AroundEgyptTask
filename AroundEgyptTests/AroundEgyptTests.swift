//
//  AroundEgyptTests.swift
//  AroundEgyptTests
//
//  Created by iOSAYed on 29/06/2025.
//

import XCTest
@testable import AroundEgypt

final class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel!

    override func setUpWithError() throws {
        sut = HomeViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_viewDidLoad_recommendedExperiencesLoadedSuccessfully() async throws {
        await sut.viewDidLoad()

        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.recommendedExperiences.isEmpty)

        let actualExperience = sut.recommendedExperiences.first
        XCTAssertNotNil(actualExperience)
        XCTAssertTrue(actualExperience?.isRecommended ?? false)
        XCTAssertFalse(actualExperience?.id.isEmpty ?? true)
        XCTAssertFalse(actualExperience?.title.isEmpty ?? true)
    }

    func test_viewDidLoad_recentExperiencesLoadedSuccessfully() async throws {
        await sut.viewDidLoad()
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.recentExperiences.isEmpty)
        let actualExperience = sut.recentExperiences.first
        XCTAssertNotNil(actualExperience)
        XCTAssertFalse(actualExperience?.isRecommended ?? true)
        XCTAssertFalse(actualExperience?.id.isEmpty ?? true)
        XCTAssertFalse(actualExperience?.title.isEmpty ?? true)
    }

    func test_initialState_shouldHaveCorrectDefaults() {
        XCTAssertTrue(sut.recommendedExperiences.isEmpty)
        XCTAssertTrue(sut.recentExperiences.isEmpty)
        XCTAssertTrue(sut.filteredExperiences.isEmpty)
        XCTAssertNil(sut.selectedID)
        XCTAssertTrue(sut.isLoading)
        XCTAssertFalse(sut.isSearching)
        XCTAssertNil(sut.error)
    }
}
