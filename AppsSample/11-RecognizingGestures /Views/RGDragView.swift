//
//  RGDragView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/5.
//

import SwiftUI

struct RGDragView: View {
    
    private let size:CGFloat = 100
    @State var offset = CGSize.zero
    
    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                offset = CGSize(
                    width: value.startLocation.x + value.translation.width - size/2,
                    height: value.startLocation.y + value.translation.height - size/2)
            }
    }
    
    var body: some View {
        VStack(content: {
            Text("Use one finger to drag the circle around")
            Spacer()
            Circle()
                .foregroundColor(.teal)
                .frame(width: size, height: size)
                .offset(offset)
                .gesture(dragGesture)
            
            Spacer()
        })
        .navigationTitle("Drag")
        .padding()
        .toolbar(content: {
            Button("Reset") {
                offset = .zero
            }
        })
    }
}

#Preview {
    NavigationView(content: {
        RGDragView()
    })
}
