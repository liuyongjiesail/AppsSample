//
//  BLOrientationDataView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/20.
//

import SwiftUI

struct BLOrientationDataView: View {
    @EnvironmentObject var detector: BLMotionDetector
    
    var rollString: String {
        detector.roll.describeAsFixedLengthString()
    }
    
    var pitchString: String {
        detector.pitch.describeAsFixedLengthString()
    }
    
    var body: some View {
        VStack {
            Text("Horizontal：" + rollString)
                .font(.system(.body, design: .monospaced))
            Text("Vertical：" + pitchString)
                .font(.system(.body, design: .serif))
        }
    }
}

struct BLOrientationDataView_Previews: PreviewProvider {
    static var previews: some View {
        BLOrientationDataView().environmentObject(BLMotionDetector(updateInterval: 0.01).started())
    }
}
