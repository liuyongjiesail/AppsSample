//
//  DPEventEditor.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/13.
//

import SwiftUI

struct DPEventEditorView: View {
    
    @EnvironmentObject var eventData: DPEventData
    
    @Binding var event: DPEvent
    var isNew = false
    
    @State private var isDeleted = false
    @Environment(\.dismiss) private var dismiss
    
    @State private var eventCopy = DPEvent()
    @State private var isEditing = false
    
    private var isEventDeleted: Bool {
        !eventData.exists(event) && !isNew
    }
    
    var body: some View {
        VStack {
            DPEventDetailView(event: $eventCopy, isEditing: isNew ? true : isEditing)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        if isNew {
                            Button("Cancel") {
                                dismiss()
                            }
                        }
                    }
                    ToolbarItem {
                        Button {
                            if isNew {
                                eventData.events.append(eventCopy)
                                dismiss()
                            } else {
                                if isEditing && !isDeleted {
                                    print("Done, saving any changes to \(event.title).")
                                    withAnimation {
                                        event = eventCopy
                                    }
                                }
                                isEditing.toggle()
                            }
                        } label: {
                            Text(isNew ? "Add" : (isEditing ? "Done" : "Edit"))
                        }
                    }
                }
                .onAppear {
                    eventCopy = event
                }
                .disabled(isEventDeleted)
            if isEditing && !isNew {
                Button(role: .destructive) {
                    isDeleted = true
                    dismiss()
                    eventData.delete(event)
                } label: {
                    Label("Delete Event", systemImage: "trash.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                }
                .padding()
            }
        }
//        .background(.yellow)
        .overlay(alignment: .center) {
            if isEventDeleted {
                Color(UIColor.systemBackground)
                Text("Event Deleted. Select an Event.")
                    .foregroundStyle(.secondary)
            }
        }
        
    }
}

struct DPEventEditorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DPEventEditorView(event: .constant(DPEvent.example)).environmentObject(DPEventData())
        }
        NavigationView {
            DPEventEditorView(event: .constant(DPEvent.example), isNew: true).environmentObject(DPEventData())
        }
    }
}
