//
//  ASSpinningView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/7.
//

import SwiftUI

struct ASResetEllipse: View {
    var body: some View {
        Ellipse()
            .frame(width: 200, height: 200)
            .foregroundColor(.orange)
    }
}

struct ASSpinningEllipse: View {
    @State private var width: CGFloat = 200
    
    var body: some View {
        Ellipse()
            .frame(width: width, height: 200)
            .foregroundColor(.orange)
            .onAppear {
                withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(2)) {
                    width = 0
                }
            }
    }
}

struct ASSpinningView: View {
    
    @State private var isSpinning = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if isSpinning {
                ASSpinningEllipse()
            } else {
                ASResetEllipse()
            }
            
            Spacer()
            
            ASPlayResetButton(animating: $isSpinning)
        }
        .navigationTitle("Spinning Animation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ASSpinningView()
    }
}
