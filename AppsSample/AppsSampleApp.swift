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
    
    private var rootViews: [AnyView] = [
        AnyView(TabContentView()),
        AnyView(StoryContentView()),
        AnyView(PlannerContentView()),
        AnyView(ColorGridContentView()),
        AnyView(SymbolGridContentView()),
        AnyView(ImageGalleryContentView()),
        AnyView(BubbleLevelContentView()),
        AnyView(SeismometerContentView()),
        AnyView(AnimatingShapesContentView())
    ]

    var body: some Scene {
        WindowGroup {
//            rootViews.randomElement()
//            TabContentView()
//            StoryContentView()
//            PlannerContentView()
//            ColorGridContentView()
//            SymbolGridContentView()
//            ImageGalleryContentView()
//            BubbleLevelContentView()
//            SeismometerContentView()
//            AnimatingShapesContentView()
            PreviewingCameraContentView()
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
