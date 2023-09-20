//
//  MomoCreatorContentView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/19.
//

import SwiftUI

struct MemeCreatorContentView: View {
    
    @StateObject private var fetcher = MMPandaCollectionFetcher()
    
    var body: some View {
        NavigationStack {
            MMMemeCreatorView().environmentObject(fetcher)
        }
    }
}

struct MomoCreatorContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemeCreatorContentView()
    }
}
