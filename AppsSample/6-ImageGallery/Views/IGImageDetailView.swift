//
//  IGImageDetailView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/16.
//

import SwiftUI

struct IGImageDetailView: View {
    
    var url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

struct IGImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IGImageDetailView(url: Bundle.main.url(forResource: "grizzly", withExtension: "jpg"))
    }
}
