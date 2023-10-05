//
//  RGTapView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/5.
//

import SwiftUI

struct RGTapView: View {
    
    @State private var color:Color = Color.primary
    
    var tapGesture: some Gesture {
        TapGesture()
            .onEnded {
                withAnimation {
                    color = Color.random()
                }
            }
    }
    
    var body: some View {
        VStack(content: {
            Text("Tap the rectangle to change its color")
            Spacer()
            Rectangle()
                .foregroundColor(color)
                .frame(width: 250, height: 450)
                .gesture(tapGesture)
            Spacer()
        })
        .navigationTitle("Tap")
        .padding()
        .toolbar(content: {
            Button("Reset") {
                color = Color.primary
            }
        })
    }
}

#Preview {
    NavigationView(content: {
        RGTapView()
    })
}

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
