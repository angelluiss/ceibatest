//
//  ceibatestAppApp.swift
//  ceibatestApp
//
//  Created by inicial on 22/9/22.
//

import SwiftUI

@main
struct ceibatestAppApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
        }
    }
}
