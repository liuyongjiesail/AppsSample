//
//  PCThumbnailView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/23.
//

import SwiftUI

struct PCThumbnailView: View {
    
    var image: Image?
    
    var body: some View {
        ZStack(content: {
            Color.white
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
            }
        })
        .frame(width: 41, height: 41)
        .cornerRadius(11)
        
    }
        
}

#Preview {
    PCThumbnailView(image: nil)
}
