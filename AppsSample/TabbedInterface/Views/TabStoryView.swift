//
//  TabStoryView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/12.
//

import SwiftUI

struct TabStoryView: View {
    var body: some View {
        VStack {
            Text("My Story")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            ScrollView {
                Text(information.story)
                    .font(.body)
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
            }
            .background(.blue)
        }
        .padding([.top, .bottom], 50)
    }
}

struct TabStoryView_Previews: PreviewProvider {
    static var previews: some View {
        TabStoryView()
    }
}
