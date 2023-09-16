//
//  IGDataModel.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/15.
//

import Foundation

class IGDataModel: ObservableObject {
    
    @Published var items: [IGItem] = []
    
    init() {
        if let documentDirectory = FileManager.default.documentDirectory {
            let urls = FileManager.default.getContentsOfDirectory(documentDirectory).filter { $0.isImage }
            for url in urls {
                let item = IGItem(url: url)
                items.append(item)
            }
        }
        
        if let urls = Bundle.main.urls(forResourcesWithExtension: ".jpg", subdirectory: nil) {
            for url in urls {
                let item = IGItem(url: url)
                items.append(item)
            }
        }
    }
    
    func addItem(_ item: IGItem) {
        items.append(item)
    }
    
    func removeItem(_ item: IGItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
            FileManager.default.removeItemFromDocumentDirectory(url: item.url)
        }
    }
}

extension URL {
    var isImage: Bool {
        let imageExtensions = ["jpg", "jpeg", "png", "gif", "heic"]
        return imageExtensions.contains(self.pathExtension)
    }
}
