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
    let views: Int
    var likes: Int
    let isRecommended: Bool
}

extension Experience {
    static let empty = Experience(
        id: "0",
        imagePath: "",
        title: "",
        views: 0,
        likes: 0,
        isRecommended: false
    )

    static let preview = Experience(
        id: "1",
        imagePath:  // swiftlint:disable:next line_length
            "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/8/u7zLSOi0EE4kK5lx8uLwQPotLV5Y6z-metaaW0za1pvdlVFbHAyelZrbDY4c3E1S1FkSkNWd0VlSjk1NkpZZ1gxcS5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20241206%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20241206T120712Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=576ff02d7310a7159aafa27c25db11259bacea943459546e152144dcf473122a",
        title: "Abu Simbel",
        views: 30226,
        likes: 1904,
        isRecommended: true
    )

    static let previewList = [
        Experience(
            id: "2",
            imagePath:  // swiftlint:disable:next line_length
                "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/8/u7zLSOi0EE4kK5lx8uLwQPotLV5Y6z-metaaW0za1pvdlVFbHAyelZrbDY4c3E1S1FkSkNWd0VlSjk1NkpZZ1gxcS5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20241206%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20241206T120712Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=576ff02d7310a7159aafa27c25db11259bacea943459546e152144dcf473122a",
            title: "Abu Simbel",
            views: 30226,
            likes: 1904,
            isRecommended: true
        ),
        Experience(
            id: "3",
            imagePath:  // swiftlint:disable:next line_length
                "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/8/u7zLSOi0EE4kK5lx8uLwQPotLV5Y6z-metaaW0za1pvdlVFbHAyelZrbDY4c3E1S1FkSkNWd0VlSjk1NkpZZ1gxcS5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20241206%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20241206T120712Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=576ff02d7310a7159aafa27c25db11259bacea943459546e152144dcf473122a",
            title: "Abu Simbel",
            views: 30226,
            likes: 1904,
            isRecommended: true
        ),
        Experience(
            id: "4",
            imagePath:  // swiftlint:disable:next line_length
                "https://aroundegypt-production.s3.eu-central-1.amazonaws.com/8/u7zLSOi0EE4kK5lx8uLwQPotLV5Y6z-metaaW0za1pvdlVFbHAyelZrbDY4c3E1S1FkSkNWd0VlSjk1NkpZZ1gxcS5qcGVn-.jpg?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIASZMRQEMKBKVP4NHO%2F20241206%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20241206T120712Z&X-Amz-SignedHeaders=host&X-Amz-Expires=172800&X-Amz-Signature=576ff02d7310a7159aafa27c25db11259bacea943459546e152144dcf473122a",
            title: "Abu Simbel",
            views: 30226,
            likes: 1904,
            isRecommended: true
        ),
    ]
}
