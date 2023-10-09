//
//  ASDancingDotsView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/9.
//

import SwiftUI

class ASSmallDot: Identifiable, ObservableObject {
    let id = UUID()
    
    @Published var offset: CGSize = .zero
    @Published var color: Color = .primary
}

class ASBigDot: Identifiable, ObservableObject {
    let id = UUID()
    
    @Published var offset: CGSize = .zero
    @Published var color: Color = .primary
    @Published var scale: Double = 1.0
    @Published var smallDots = [ASSmallDot]()
    
    init() {
        for _ in 0..<5 {
            smallDots.append(ASSmallDot())
        }
    }
    
    func randomizePositions() {
        objectWillChange.send()
        for dot in smallDots {
            dot.offset = CGSize(width: Double.random(in: -120...120), height: Double.random(in: -120...120))
            dot.color = ASDotTracker.randomColor
        }
    }
    
    func resetPositions() {
        objectWillChange.send()
        for dot in smallDots {
            dot.offset = .zero
            dot.color = .primary
        }
    }
}

class ASDotTracker: ObservableObject {
    @Published var bigDots = [ASBigDot]()
    
    static var colors: [Color] = [.pink, .purple, .mint, .blue, .yellow, .red, .teal, .cyan]
    static var randomColor: Color {
        colors.randomElement() ?? .blue
    }
    
    init() {
        for _ in 0..<100 {
            bigDots.append(ASBigDot())
        }
    }
    
    func randomizePositions() {
        objectWillChange.send()
        for bigDot in bigDots {
            bigDot.offset = CGSize(width: Double.random(in: -50...50), height: Double.random(in: -50...50))
            bigDot.scale = 2.5
            bigDot.color = ASDotTracker.randomColor
            bigDot.randomizePositions()
        }
    }
    
    func resetPositions() {
        objectWillChange.send()
        for bigDot in bigDots {
            bigDot.offset = .zero
            bigDot.scale = 1.0
            bigDot.color = ASDotTracker.randomColor
            bigDot.resetPositions()
        }
    }
}

struct ASDancingDotsView: View {
    
    private var columns = Array(repeating: GridItem(.flexible()), count: 10)
    @StateObject var tracker = ASDotTracker()
    @State private var isAnimating = false
    
    var body: some View {
        VStack(content: {
            Spacer()
            LazyVGrid(columns: columns, content: {
                ForEach(tracker.bigDots) { bigDot in
                    ZStack {
                        Circle()
                            .offset(bigDot.offset)
                            .foregroundColor(bigDot.color)
                            .scaleEffect(bigDot.scale)
                        ForEach(bigDot.smallDots) { smallDot in
                            Circle()
                                .offset(smallDot.offset)
                                .foregroundColor(smallDot.color)
                        }
                    }
                }
                
            })
            .frame(minHeight: 500)
            .drawingGroup()
            Spacer()
            
            ASPlayResetButton(animating: $isAnimating) {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                    if isAnimating {
                        tracker.randomizePositions()
                    } else {
                        tracker.resetPositions()
                        print("123")
                    }
                }
            }
        })
        .navigationTitle("Dancing Dots")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView(content: {
        ASDancingDotsView()
    })
}
