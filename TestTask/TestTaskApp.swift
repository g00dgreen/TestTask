//
//  TestTaskApp.swift
//  TestTask
//
//  Created by Артем Макар on 21.05.24.
//

import SwiftUI

@main
struct TestTaskApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model: CellViewModel(model: []))
        }
    }
}
