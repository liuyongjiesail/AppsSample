//
//  PCCameraView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/10/19.
//

import SwiftUI

struct PCCameraView: View {
    
    @StateObject private var model = PCDataModel()
    
    private static let barHeightFactor = 0.15
    
    var body: some View {
        NavigationStack {
            GeometryReader(content: { geometry in
                PCViewfinderView(image: $model.viewfinderImage)
                    .overlay(alignment: .top) {
                        Color.black
                            .opacity(0.75)
                            .frame(height: geometry.size.height * Self.barHeightFactor)
                    }
                    .overlay(alignment: .bottom) {
                        buttonView()
                            .frame(height: geometry.size.height * Self.barHeightFactor)
                            .background(.black.opacity(0.75))
                    }
                    .overlay(alignment: .center) {
                        Color.clear
                            .frame(height: geometry.size.height * (1 - (Self.barHeightFactor * 2)))
                            .accessibilityElement()
                            .accessibilityLabel("View Finder")
                            .accessibilityAddTraits([.isImage])
                    }
                    .background(.black)
            })
            .task {
                await model.camera.start()
                await model.loadPhotos()
                await model.loadThumbnail()
            }
            .navigationTitle("Camera")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .statusBar(hidden: true)
        }
    }
    
    private func buttonView() -> some View {
        HStack(spacing: 60) {
            Spacer()
            
            NavigationLink {
                PCPhotoCollectionView(photoCollection: model.photoCollection)
                    .onAppear() {
                        model.camera.isPreviewPaused = true
                    }
                    .onDisappear() {
                        model.camera.isPreviewPaused = false
                    }
            } label: {
                Label(
                    title: { Text("Gallery") },
                    icon: { PCThumbnailView(image:model.thumbnailImage) }
                )
            }
            
            Button(action: {
                model.camera.takePhoto()
            }, label: {
                Label(
                    title: { Text("Take Photo") },
                    icon: { ZStack(content: {
                        Circle()
                            .strokeBorder(.white, lineWidth: 3)
                            .frame(width: 62, height: 62)
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                    }) }
                )
            })
            
            Button(action: {
                model.camera.switchCaptureDevice()
            }, label: {
                Label("Switch Camera", systemImage: "arrow.triangle.2.circlepath")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
            })
            
            Spacer()

        }
        .buttonStyle(.plain)
        .labelStyle(.iconOnly)
        .padding()
    }
}

#Preview {
    PCCameraView()
}
