//
//  IGGridItemView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/16.
//

import SwiftUI

struct IGGridItemView: View {
    
    let size: Double
    let item: IGItem
    
    var body: some View {
        ZStack {
            AsyncImage(url: item.url) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: size, height: size)
        }
    }
}

struct IGGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = Bundle.main.url(forResource: "grizzly", withExtension: "jpg") {
            IGGridItemView(size: 200, item: IGItem(url: url))
        }
    }
}
