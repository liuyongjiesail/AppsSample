//
//  RGRotateView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/5.
//

import SwiftUI

struct RGRotateView: View {
    
    @State private var rotation = Angle.zero
    
    private var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { angle in
                rotation = angle
            }
            .onEnded { angle in
                rotation = angle
            }
    }
    
    var body: some View {
        VStack(content: {
            Text("Use two fingers to rotate the box")
            Spacer()
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 225, height: 225)
                .rotationEffect(rotation)
                .gesture(rotationGesture)
            Spacer()
        })
        .navigationTitle("")
        .padding()
        .toolbar(content: {
            Button("Reset") {
                rotation = .zero
            }
        })
    }
}

#Preview {
    NavigationView {
        RGRotateView()
    }
}
