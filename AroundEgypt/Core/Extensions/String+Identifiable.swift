//
//  String+Identifiable.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import Foundation

extension String: @retroactive Identifiable {
    public var id: Int {
        return hash
    }
}