//
// IdentifiableString.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

struct IdentifiableString: Identifiable {
    let id = UUID()
    let value: String

    init(_ value: String) {
        self.value = value
    }
}
