//
//  AroundEgyptApp.swift
//  AroundEgypt
//
//  Created by iOSAYed on 29/06/2025.
//

import SwiftUI

@main
struct AroundEgyptApp: App {
    init() {
        UIView.appearance().overrideUserInterfaceStyle = .light
        NetworkMonitor.shared.startMonitoring()
    }

    var body: some Scene {
        WindowGroup {
            HomeScreen(viewModel: HomeViewModel())
        }
    }
}
