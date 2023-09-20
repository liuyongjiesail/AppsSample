//
//  BubbleLevelContentView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/20.
//

import SwiftUI

struct BubbleLevelContentView: View {
    @StateObject private var motionDetector = BLMotionDetector(updateInterval: 0.01)
    
    var body: some View {
        BLLevelView().environmentObject(motionDetector)
    }
}

struct BubbleLevelContentView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleLevelContentView()
    }
}
