//
//  MMLoadableImageView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/19.
//

import SwiftUI

struct MMLoadableImageView: View {
    var imageMetadata: MMPanda
    
    var body: some View {
        AsyncImage(url: imageMetadata.imageUrl) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .accessibility(hidden: false)
                    .accessibilityLabel(Text(imageMetadata.description))
            } else if phase.error != nil {
                VStack {
                    Image("pandaplaceholder")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                    Text("The pandas were all busy.")
                        .font(.title2)
                    Text("Please try agaion")
                        .font(.title3)
                }
            } else {
                ProgressView()
            }
        }
    }
}

struct MMLoadableImageView_Previews: PreviewProvider {
    static var previews: some View {
        MMLoadableImageView(imageMetadata: MMPanda.defaultPanda)
    }
}
