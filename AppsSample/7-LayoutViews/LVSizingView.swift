//
//  LVSizingView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/17.
//

import SwiftUI

struct LVSizingView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.brown)
                    .frame(maxWidth: 200, maxHeight: 150)
                VStack {
                    Text("Roses are red")
                    Image(systemName: "box.truck.fill")
                        .frame(width: 50, height: 50)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.pink)
                    Text("violets are blue, ")
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.brown)
                    .frame(maxWidth: 200, maxHeight: 150)
                VStack {
                    Text("I just love")
                    Image(systemName: "bicycle")
                        .frame(width: 50, height: 50)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.pink)
                    Text("coding with you!")
                }
            }
        }
        .font(.headline)
        .foregroundColor(.white)
        .padding()
    }
}

struct LVSizingView_Previews: PreviewProvider {
    static var previews: some View {
        LVSizingView()
    }
}
