//
//  DPEventListView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/12.
//

import SwiftUI

struct DPEventListView: View {
    
    @EnvironmentObject var eventData: DPEventData
    @State private var isAddingNewEvent = false
    @State private var newEvent = DPEvent()
    
    var body: some View {
        
        List {
            ForEach(Period.allCases) { period in
                if !eventData.sortedEvents(period: period).isEmpty {
                    Section(content: {
                        ForEach(eventData.sortedEvents(period: period)) { $event in
                            NavigationLink {
                                DPEventEditorView(event:$event)
                            } label: {
                                DPEventRowView(event: event)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    eventData.delete(event)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }, header: {
                        Text(period.name)
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                            .padding(Edge.Set.leading, -15)
                    })
                    .listRowSeparator(.automatic)
                }
            }
        }
        .navigationTitle("Date Planner")
        .toolbar {
            ToolbarItem {
                Button {
                    newEvent = DPEvent()
                    isAddingNewEvent = true
                } label: {
                    Image(systemName: "plus")
                }
                .background(.red)
            }
        }
        .sheet(isPresented: $isAddingNewEvent) {
            NavigationView {
                DPEventEditorView(event: $newEvent, isNew: true)
            }
        }
    }
}

struct DPEventListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DPEventListView().environmentObject(DPEventData())
        }
    }
}
