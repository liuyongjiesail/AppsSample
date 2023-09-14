//
//  DPEvent.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/12.
//

import Foundation
import SwiftUI

struct DPEvent: Identifiable, Hashable {
    
    var id = UUID()
    var symbol: String = "case.fill"
    var color: Color = .gray
    var title = ""
    var tasks = [DPEventTask(text: "")]
    var date = Date()
    
    var remainingTaskCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    
    var isComplete: Bool {
        tasks.allSatisfy { $0.isCompleted }
    }
    
    var isPast: Bool {
        date < Date.now
    }
    
    var isWithinSevenDays: Bool {
        !isPast && date < Date.now.sevenDaysOut
    }
    
    var isWithinSevenToThirtyDays: Bool {
        !isPast && !isWithinSevenDays && date < Date.now.thirtyDaysOut
    }
    
    var isDistant: Bool {
        date >= Date().thirtyDaysOut
    }
    
    static var example = DPEvent(
        symbol: "case.fill",
        title: "Sayulita Trip",
        tasks: [
            DPEventTask(text: "Buy plane tickets"),
            DPEventTask(text: "Get a new bathing suit"),
            DPEventTask(text: "Find an airbnb")
        ],
        date: Date(timeIntervalSinceNow: 60*60*24*365*1.5)
    )
    
}

extension Date {
    var sevenDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 7, to: self) ?? self
    }
    
    var thirtyDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 30, to: self) ?? self
    }
}
