//
//  MMPandaCollectionFetcher.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/19.
//

import SwiftUI

class MMPandaCollectionFetcher: ObservableObject {
    @Published var imageData = MMPandaCollection(sample: [MMPanda.defaultPanda])
    @Published var currentPanda = MMPanda.defaultPanda
    
    let urlString = "http://playgrounds-cdn.apple.com/assets/pandaData.json"
    
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
    func fetchData() async
    throws {
        guard let url = URL(string: urlString) else { return }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }
        
        Task { @MainActor in
            imageData = try JSONDecoder().decode(MMPandaCollection.self, from: data)
        }
    }
}
