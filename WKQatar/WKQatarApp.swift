//
//  WKQatarApp.swift
//  WKQatar
//
//  Created by RorySys on 03/12/2024.
//

import SwiftUI

@main
struct WKQatarApp: App {
    var body: some Scene {
        @State var dataStore = WKDataStore()
        WindowGroup {
            ContentView()
                .environment(dataStore.self)
        }
    }
}
