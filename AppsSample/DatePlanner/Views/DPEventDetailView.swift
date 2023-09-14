//
//  DPEventDetail.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/13.
//

import SwiftUI

struct DPEventDetailView: View {
    
    @Binding var event: DPEvent
    let isEditing: Bool
    
    @State private var isPickingSymbol = false
    
    var body: some View {
        List {
            HStack {
                Button {
                    isPickingSymbol.toggle()
                } label: {
                    Image(systemName: event.symbol)
                        .sfSymbolStyling()
                        .foregroundColor(event.color)
                        .opacity(isEditing ? 0.3 : 1)
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 5)
                
                if isEditing {
                    TextField("New Event", text: $event.title)
                        .font(.title2)
                } else {
                    Text(event.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
            }
            
            if isEditing {
                DatePicker("Date", selection: $event.date)
                    .labelsHidden()
                    .fontWeight(.semibold)
                
            } else {
                HStack {
                    Text(event.date, style: .date)
                    Text(event.date, style: .time)
                }
                .listRowSeparator(.hidden)
            }
            
            Text("Tasks")
                .fontWeight(.bold)
            
            ForEach($event.tasks) { $item in
                DPTaskRowView(task: $item, isEditing: isEditing)
            }
            .onDelete { indexSet in
                event.tasks.remove(atOffsets: indexSet)
            }
            
            Button {
                event.tasks.append(DPEventTask(text: "", isNew: true))
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add Task")
                }
            }
            .buttonStyle(.plain)
        }
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .sheet(isPresented: $isPickingSymbol) {
            DPSymbolPickerView(event: $event)
        }
    }
}

struct DPEventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DPEventDetailView(event: Binding.constant(DPEvent.example), isEditing: true)
    }
}
