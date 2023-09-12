//
//  AppsSampleApp.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/12.
//

import SwiftUI

@main
struct AppsSampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
