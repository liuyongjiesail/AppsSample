//
//  PCViewfinderView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/19.
//

import SwiftUI

struct PCViewfinderView: View {
    @Binding var image: Image?
    
    var body: some View {
        GeometryReader(content: { geometry in
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        })
    }
}

#Preview {
    PCViewfinderView(image: Binding.constant(Image(systemName: "pencil")))
}
