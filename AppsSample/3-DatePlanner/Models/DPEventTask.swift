//
//  DPEventTask.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/12.
//

import Foundation

struct DPEventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}
