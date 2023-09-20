//
//  BLLevelView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/20.
//

import SwiftUI

struct BLLevelView: View {
    
    @EnvironmentObject var motionDetector: BLMotionDetector

    var body: some View {
        VStack {
            BLBubbleLevelView()
            BLOrientationDataView()
                .padding(80)
        }
        .onAppear {
            motionDetector.start()
        }
        .onDisappear {
            motionDetector.stop()
        }
    }
}

struct BLLevelView_Previews: PreviewProvider {
    static var previews: some View {
        BLLevelView().environmentObject(BLMotionDetector(updateInterval: 0.01).started())
    }
}
