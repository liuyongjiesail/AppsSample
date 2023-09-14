//
//  DPEventRowView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/13.
//

import SwiftUI

struct DPEventRowView: View {
    
    let event: DPEvent
    
    var body: some View {
        HStack {
            Image(systemName: event.symbol)
                .sfSymbolStyling()
                .foregroundStyle(event.color)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(event.title)
                    .fontWeight(.bold)
                Text(event.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            if event.isComplete {
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundStyle(.secondary)
            }
        }
        .badge(event.remainingTaskCount)
    }
}

struct DPEventRowView_Previews: PreviewProvider {
    static var previews: some View {
        DPEventRowView(event: DPEvent.example)
    }
}
