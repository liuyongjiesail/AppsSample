//
//  PCPhotoCollectionView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/24.
//

import SwiftUI

struct PCPhotoCollectionView: View {
    @ObservedObject var photoCollection: PhotoCollection
    
    @Environment(\.displayScale) private var displayScale
    
    private static let itemSpacing = 12.0
    private static let itemCornerRadius = 15.0
    private static let itemSize = CGSize(width: 90, height: 90)
    
    private var imageSize: CGSize {
        return CGSize(width: Self.itemSize.width * min(displayScale, 2), height: Self.itemSize.height * min(displayScale, 2))
    }
    
    private let colums = [
        GridItem(.adaptive(minimum: itemSize.width, maximum: itemSize.height), spacing: itemSpacing)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums, content: {
                ForEach(photoCollection.photoAssets) { asset in
                    NavigationLink {
                        PCPhotoView(asset: asset, cache: photoCollection.cache)
                    } label: {
                        photoItemView(asset: asset)
                    }
                    .buttonStyle(.borderless)
                    .accessibilityLabel(asset.accessibilityLabel)
                }
                
            })
            .padding([.vertical], Self.itemSpacing)
        }
        .navigationTitle(photoCollection.albumName ?? "Gallery")
        .navigationBarTitleDisplayMode(.inline)
        .statusBar(hidden: false)
    }
    
    private func photoItemView(asset: PhotoAsset) -> some View {
        PCPhotoItemView(asset: asset, cache: photoCollection.cache, imageSize: imageSize)
            .frame(width: Self.itemSize.width, height: Self.itemSize.height)
            .clipped()
            .cornerRadius(Self.itemCornerRadius)
            .overlay(alignment:.bottomLeading) {
                if asset.isFavorite {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.3), radius: 5, x: 0, y: 1)
                        .font(.callout)
                        .offset(x: 4, y: -4)
                }
            }
            .onAppear() {
                Task {
                    await photoCollection.cache.startCaching(for:[asset] ,targetSize:imageSize)
                }
            }
            .onDisappear() {
                Task {
                    await photoCollection.cache.startCaching(for:[asset] ,targetSize:imageSize)
                }
            }
    }
}

//#Preview {
//    PCPhotoCollectionView(photoCollection: <#PhotoCollection#>)
//}
