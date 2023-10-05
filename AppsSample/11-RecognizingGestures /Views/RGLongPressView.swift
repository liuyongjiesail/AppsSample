//
//  RGLongPressView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/5.
//

import SwiftUI

struct RGLongPressView: View {
    
    @State private var index = 0
    
    private var sizes:[CGSize] = [
        CGSize(width: 150, height: 80),
        CGSize(width: 200, height: 40),
        CGSize(width: 50, height: 250),
        CGSize(width: 220, height: 100),
        CGSize(width: 90, height: 90)
    ]
    
    private var longPressGesture: some Gesture {
        LongPressGesture()
            .onEnded {_ in 
                withAnimation {
                    index += 1
                    if index == sizes.count {
                        index = 0
                    }
                }
            }
    }
    
    var body: some View {
        VStack(content: {
            Text("Touch and hold the capsule to change its size")
            Spacer()
            Capsule()
                .foregroundColor(.yellow)
                .frame(width: sizes[index].width, height: sizes[index].height)
                .gesture(longPressGesture)
            Spacer()
        })
        .navigationTitle("Touch And Hold")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .toolbar(content: {
            Button("Reset") {
                withAnimation {
                    index = 0
                }
            }
        })
    }
}

#Preview {
    NavigationView(content: {
        RGLongPressView()
    })
}
