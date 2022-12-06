//
//  QrChefApp.swift
//  QrChef
//
//  Created by apprenant1 on 29/11/2022.
//

import SwiftUI

@main
struct QrChefApp: App {
    @StateObject private var vm = LoginViewModel()
//    @StateObject private var vm = CommandViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
//            ScanQRCodeView(filter: .none).environmentObject(Prospects())
        }
    }
}
