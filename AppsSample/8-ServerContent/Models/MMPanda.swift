//
//  MMPanda.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/19.
//

import SwiftUI

struct MMPanda: Codable {
    var description: String
    var imageUrl: URL?
    
    static let defaultPanda = MMPanda(description: "Cute Panda", imageUrl: URL(string: "https://playgrounds-cdn.apple.com/assets/pandas/pandaBday.jpg"))
    
}

struct MMPandaCollection: Codable {
    var sample: [MMPanda]
}
