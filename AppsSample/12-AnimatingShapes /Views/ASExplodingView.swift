//
//  ASExplodingView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/7.
//

import SwiftUI

struct ASExplodingView: View {
    
    @State private var isExploded = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack(content: {
                ForEach(0..<75) { _ in
                    Rectangle()
                        .rotation(Angle(degrees: Double.random(in: 0..<360)))
                        .frame(width: 20, height: 20)
                        .foregroundColor(.indigo)
                        .offset(x: isExploded ? (Double.random(in: -1...1) * 500) : 0,
                                y: isExploded ? (Double.random(in: -1...1) * 500) : 0)
                        .opacity(isExploded ? 0 : 1)
                        .animation(.easeInOut.speed(0.6), value: isExploded)
                        .padding()
                }
                Rectangle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.indigo)
                    .opacity(isExploded ? 0 : 1)
                    .animation(.easeInOut.speed(0.6), value: isExploded)
                    .padding()
            })
            Spacer()
            ASPlayResetButton(animating: $isExploded)
        }
        .navigationTitle("Explosion Animation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ASExplodingView()
    }
}
