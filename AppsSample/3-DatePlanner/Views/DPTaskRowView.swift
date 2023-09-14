//
//  DPTaskRowView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/13.
//

import SwiftUI

struct DPTaskRowView: View {
    
    @Binding var task: DPEventTask
    var isEditing: Bool
    @FocusState private var isFocused: Bool
    
    
    var body: some View {
        HStack {
            Button {
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            
            if isEditing || task.isNew {
                TextField("Task description", text: $task.text)
                    .focused($isFocused)
                    .onChange(of: isFocused) { newValue in
                        if newValue == false {
                            task.isNew = false
                        }
                    }
            } else {
                Text(task.text)
            }
            Spacer()
        }
        .padding(.vertical, 10)
        .task {
            if task.isNew {
                isFocused = true
            }
        }
    }
}

struct DPTaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        DPTaskRowView(task: Binding.constant(DPEventTask(text: "Do something!", isCompleted: true)), isEditing: false)
    }
}
