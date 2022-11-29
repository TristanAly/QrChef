//
//  QrChefApp.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import SwiftUI

@main
struct QrChefApp: App {
    @StateObject private var vm = RestaurantViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
