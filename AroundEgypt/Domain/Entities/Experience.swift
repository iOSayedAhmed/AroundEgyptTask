//
//  Experience.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import SwiftUI

struct Experience: Identifiable {
    let id: String
    let imagePath: String
    let title: String
    let cityName: String
    let description: String
    let views: Int
    var likes: Int
    let isRecommended: Bool
    var isLiked: Bool

    init(id: String, imagePath: String, title: String, views: Int, likes: Int, isRecommended: Bool) {
        self.id = id
        self.imagePath = imagePath
        self.title = title
        self.views = views
        self.likes = likes
        self.isRecommended = isRecommended
        self.description = ""
        self.cityName = ""
        self.isLiked = LikesCacheManager.shared.getState(for: id)
    }

    init(id: String, imagePath: String, title: String, views: Int, likes: Int, isRecommended: Bool, description: String, cityName: String) {
            self.id = id
            self.imagePath = imagePath
            self.title = title
            self.views = views
            self.likes = likes
            self.isRecommended = isRecommended
            self.description = description
            self.cityName = cityName
            self.isLiked = LikesCacheManager.shared.getState(for: id)
        }
}

extension Experience {
    static let empty = Experience(id: "", imagePath: "", title: "", views: 0, likes: 0, isRecommended: false)

    static let preview = Experience(
        id: "1",
        // swiftlint:disable:next line_length
        imagePath: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/21/DBiLufkgRD42qnvG83yuJzXiaV2NVp-metad214aWhEdnY2T2dvTzRobXRNcThkRXZOTk5sMjh5SVZCMW5BV2ZsMi5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20250629%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20250629T162854Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=8051e660855f8655980c06f5d7525c449958ff577c2197c45e54100f6fbc1fd6",
        title: "Abu Simbel",
        views: 30226,
        likes: 1904,
        isRecommended: false
    )
   

    static let previewList = [
        Experience(
            id: "1",
            // swiftlint:disable:next line_length
            imagePath: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/8/u7zLSOi0EE4kK5lx8uLwQPotLV5Y6z-metaaW0za1pvdlVFbHAyelZrbDY4c3E1S1FkSkNWd0VlSjk1NkpZZ1gxcS5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20241206%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20241206T120712Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=576ff02d7310a7159aafa27c25db11259bacea943459546e152144dcf473122a",
            title: "Abu Simbel",
            views: 60226,
            likes: 1804,
            isRecommended: false
        ),
        Experience(
            id: "2",
            // swiftlint:disable:next line_length
            imagePath: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/8/u7zLSOi0EE4kK5lx8uLwQPotLV5Y6z-metaaW0za1pvdlVFbHAyelZrbDY4c3E1S1FkSkNWd0VlSjk1NkpZZ1gxcS5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20241206%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20241206T120712Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=576ff02d7310a7159aafa27c25db11259bacea943459546e152144dcf473122a",
            title: "Abu Simbel",
            views: 70226,
            likes: 1004,
            isRecommended: false
        ),
        Experience(
            id: "3",
            // swiftlint:disable:next line_length
            imagePath: "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/8/u7zLSOi0EE4kK5lx8uLwQPotLV5Y6z-metaaW0za1pvdlVFbHAyelZrbDY4c3E1S1FkSkNWd0VlSjk1NkpZZ1gxcS5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20241206%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20241206T120712Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=576ff02d7310a7159aafa27c25db11259bacea943459546e152144dcf473122a",
            title: "Abu Simbel",
            views: 30226,
            likes: 1904,
            isRecommended: false
        )
    ]
}
