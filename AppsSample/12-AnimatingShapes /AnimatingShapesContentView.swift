//
//  AnimatingShapesContentView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/5.
//

import SwiftUI

struct AnimatingShapesContentView: View {
    
    private var pages: [AnimatingPage] = [
        AnimatingPage(pageName: "Basic Animation", pageView: AnyView(ASHeartPulseView())),
        AnimatingPage(pageName: "Spinning Animation", pageView: AnyView(ASSpinningView())),
        AnimatingPage(pageName: "Explosion Animation", pageView: AnyView(ASExplodingView())),
        AnimatingPage(pageName: "Rollin' Rainbow", pageView: AnyView(ASRollinRainbowView())),
        AnimatingPage(pageName: "Drag n' Drop It", pageView: AnyView(ASDragNDropDotsView())),
        AnimatingPage(pageName: "Dancing Dots", pageView: AnyView(ASDancingDotsView())),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(pages) { page in
                        NavigationLink(destination: page.pageView) {
                            Text(page.pageName)
                        }
                    }
                }
            }
            .navigationTitle("Animating Shapes")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AnimatingPage: Identifiable {
    var id = UUID()
    
    let pageName: String
    let pageView: AnyView
}

#Preview {
    AnimatingShapesContentView()
}
