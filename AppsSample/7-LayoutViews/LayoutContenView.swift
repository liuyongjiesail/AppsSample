//
//  LayoutContenView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/17.
//

import SwiftUI

struct LayoutContenView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.blue)
                Circle()
                    .foregroundColor(.pink)
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.blue)
                HStack {
                    Circle()
                        .foregroundColor(.red)
                    Circle()
                        .foregroundColor(.orange)
                }
            }
            
        }
    }
}

struct LayoutContenView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutContenView()
    }
}
