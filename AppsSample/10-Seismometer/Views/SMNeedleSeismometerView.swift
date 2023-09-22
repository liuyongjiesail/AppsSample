//
//  SMNeedleSeismometerView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/21.
//

import SwiftUI

struct SMNeedleSeismometerView: View {
    
    @EnvironmentObject var motionDetector: BLMotionDetector
    
    let needleAnchor = UnitPoint(x: 0.5, y: 1)
    let amplification = 2.0
    var rotationAngle: Angle {
        Angle(radians: -motionDetector.zAcceleration * amplification)
    }
    
    var body: some View {
        VStack(content: {
            Spacer()
            ZStack(alignment: .bottom, content: {
                SMGaugeBackgroundView(width: 250)
                Rectangle()
                    .foregroundColor(Color.accentColor)
                    .frame(width: 5, height: 190)
                    .rotationEffect(rotationAngle, anchor: needleAnchor)
                    .overlay {
                        VStack(content: {
                            Spacer()
                            Circle()
                                .stroke(lineWidth: 3)
                                .fill()
                                .frame(width: 10, height: 10)
                                .foregroundColor(Color.accentColor)
                                .background(Color.white)
                                .offset(x: 0, y: 5)
                        })
                    }
            })
            Spacer()
            Text("\(motionDetector.zAcceleration.describeAsFixedLengthString())")
                .font(.system(.body, design: .monospaced))
                .fontWeight(.bold)
            Spacer()
            
            Text("Set your device on a flat surface to record vibrations using its motion sensors.")
            Spacer()
        })
    }
}

#Preview {
    SMNeedleSeismometerView().environmentObject(BLMotionDetector(updateInterval: 0.01).started())
}
