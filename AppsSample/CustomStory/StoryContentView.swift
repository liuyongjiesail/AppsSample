//
//  CustomContentView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/12.
//

import SwiftUI

struct StoryContentView: View {
    var body: some View {
        NavigationStack {
            StoryPageView(story: story, pageIndex: 0)
        }
    }
}

struct StoryContentView_Previews: PreviewProvider {
    static var previews: some View {
        StoryContentView()
    }
}
