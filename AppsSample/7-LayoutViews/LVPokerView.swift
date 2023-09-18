//
//  LVPokerView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/18.
//

import SwiftUI

struct LVPokerView: View {
    var body: some View {
        VStack {
            LVHalfCardView()
            LVHalfCardView()
                .rotationEffect(.degrees(180))
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black)
        )
        .aspectRatio(0.7, contentMode: .fit)
        .padding()
    }
}

struct LVHalfCardView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "crown.fill")
                .font(.system(size: 80))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .overlay(alignment: .topLeading) {
            VStack {
                Image(systemName: "crown.fill")
                    .font(.body)
                Text("Q")
                    .font(.largeTitle)
                Image(systemName: "heart.fill")
                    .font(.title)
            }
            .padding()
        }
        .foregroundColor(.red)
    }
}

struct LVPokerView_Previews: PreviewProvider {
    static var previews: some View {
        LVPokerView()
        LVHalfCardView()
    }
}
