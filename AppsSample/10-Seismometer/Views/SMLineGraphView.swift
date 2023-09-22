//
//  SMLineGraph.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/22.
//

import SwiftUI

struct SMLineGraphView: View {
    
    let data: [Double]
    let maxData: Int
    
    let minValue: Double
    let maxValue: Double
    
    let gridSpacing = 250
    
    @State private var timestep = 0
    
    func yGraphPosition(_ dateItem: Double, in size: CGSize) -> Double {
        let proportion = (dateItem - minValue) / (maxValue - minValue)
        let yValue: Double = size.height - proportion * size.height
        return yValue
    }
    
    func xGraphPosition(_ index: Int, in size: CGSize) -> Double {
        let increment = size.width / Double(maxData)
        let base = Double(maxData - data.count) * increment
        return base + Double(index) * increment
    }
    
    var body: some View {
        Canvas { context, size in
            var lines = Path()
            
            let increment = size.width / Double(maxData)
            let phase = -1 * timestep % gridSpacing
            var x = Double(phase)
            
            repeat {
                lines.move(to: CGPoint(x: x * increment, y: 0))
                lines.addLine(to: CGPoint(x: x * increment, y: size.height))
                x += Double(gridSpacing)
            } while x <= Double(maxData)
            
            var y = size.height / 2
            repeat {
                lines.move(to: CGPoint(x: 0, y: y))
                lines.addLine(to: CGPoint(x: size.width, y: y))
                y += increment * Double(gridSpacing)
            } while y <= size.height
            
            y = size.height / 2
            repeat {
                lines.move(to: CGPoint(x: 0, y: y))
                lines.addLine(to: CGPoint(x: size.width, y: y))
                y -= increment * Double(gridSpacing)
            } while y >= 0
            
            context.stroke(lines, with: .color(.black.opacity(0.25)))
            
            guard !data.isEmpty else { return }
            
            var path = Path()
            
            path.move(to: CGPoint(x: xGraphPosition(0, in: size), y: yGraphPosition(data[0], in: size)))
            
            for (index, dataPoint) in data.dropFirst().enumerated() {
                path.addLine(to: CGPoint(x: xGraphPosition(index, in: size), y: yGraphPosition(dataPoint, in: size)))
            }
            context.stroke(path, with: .color(.accentColor))
        }
        .onChange(of: data) { _ in
            timestep += 1
        }
    }
}

#Preview {
    SMLineGraphView(data: [1], maxData: 10, minValue: 0, maxValue: 1000)
}
