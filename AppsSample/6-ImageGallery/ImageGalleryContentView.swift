//
//  IGImageGalleryView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/15.
//

import SwiftUI

struct ImageGalleryContentView: View {
    
    @StateObject var dataModel = IGDataModel()
    
    var body: some View {
        NavigationStack {
            IGGridView()
        }
        .environmentObject(dataModel)
        .navigationViewStyle(.stack)
    }
}

struct ImageGalleryContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGalleryContentView()
    }
}
