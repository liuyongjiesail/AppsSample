//
//  IGItem.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/16.
//

import Foundation

struct IGItem: Identifiable {
    let id = UUID()
    let url: URL
}

extension IGItem: Equatable {
    static func == (lhs: IGItem, rhs: IGItem) -> Bool {
        return lhs.id == rhs.id && rhs.id == rhs.id
    }
}
