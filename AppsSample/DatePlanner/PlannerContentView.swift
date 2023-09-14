//
//  PlannerContentView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/12.
//

import SwiftUI

struct PlannerContentView: View {
    @StateObject private var eventData = DPEventData()
    
    var body: some View {
        NavigationView {
            DPEventListView()
        }
        .environmentObject(eventData)
    }
}

struct PlannerContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlannerContentView()
    }
}
