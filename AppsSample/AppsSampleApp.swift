//
//  AppsSampleApp.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/12.
//

import SwiftUI

@main
struct AppsSampleApp: App {
    
    @Environment(\.scenePhase) private var scenePhase: ScenePhase

    var body: some Scene {
        WindowGroup {
//            TabContentView()
//            StoryContentView()
//            PlannerContentView()
//            ColorGridContentView()
//            SymbolGridContentView()
//            ImageGalleryContentView()
            MemeCreatorContentView()
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active: print("App active")
            case .inactive: print("App inactive")
            case .background: print("App background")
            @unknown default: print("Others")
            }
        }
    }   
}
