//
//  RGSingleLineView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/5.
//

import SwiftUI

struct RGSingleLineView: View {
    
    @State private var lineStart = CGPoint.zero
    @State private var lineEnd = CGPoint.zero
    
    private var lineDrawingGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                lineStart = value.startLocation
                lineEnd = value.location
            }
            .onEnded { value in
                lineEnd = value.location
            }
    }
    
    var body: some View {
        VStack(content: {
            Text("Touch and drag to make a line")
            Spacer()
            Path { path in
                path.move(to: lineStart)
                path.addLine(to: lineEnd)
            }
            .stroke(Color.green, lineWidth: 8.0)
            .contentShape(Rectangle())
            .gesture(lineDrawingGesture)
        })
        .navigationTitle("Line Drawing")
        .padding()
        .toolbar {
            Button("Reset") {
                lineStart = .zero
                lineEnd = .zero
            }
        }
    }
}

#Preview {
    NavigationStack {
        RGSingleLineView()
    }
}
