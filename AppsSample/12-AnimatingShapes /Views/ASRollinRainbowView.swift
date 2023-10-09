//
//  ASRollinRainbowView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/7.
//

import SwiftUI

struct ASRollinRainbowView: View {
    
    @State private var isAnimating = false
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: 10)
    @State private var colors: [Color] = [.pink, .mint, .orange, .teal, .yellow, .cyan, .purple, .blue]
    @State private var scaleFactor : CGFloat = 3
    
    let springAnimation = Animation.spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0.9)
    
    let numCircles = 100
    var body: some View {
        VStack(content: {
            Text("Tap on the dots to make them roll!")
                .padding(.vertical, 30)
            Spacer()
            LazyVGrid(columns: gridColumns, content: {
                ForEach(0..<numCircles, id: \.self) { index in
                    Circle()
                        .foregroundColor(colors[index % colors.count])
                        .scaleEffect(scaleFactor)
                        .animation(springAnimation.delay((Double(index).truncatingRemainder(dividingBy: 10) / 20)).repeatCount(2, autoreverses: true), value: scaleFactor)
                        .onTapGesture {
                            isAnimating = true
                            scaleFactor = (Double(index + 1) / 4)
                        }
                }
            })
            Spacer()
            ASPlayResetButton(animating: $isAnimating, resetOnly: true) {
                scaleFactor = 3
            }
        })
        .navigationTitle("Rollin' Rainbow")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ASRollinRainbowView()
    }
}
