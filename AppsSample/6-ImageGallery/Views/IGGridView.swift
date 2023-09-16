//
//  IGGridListView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/16.
//

import SwiftUI

struct IGGridView: View {
    
    @EnvironmentObject private var dataModel: IGDataModel
    
    @State private var isEditing = false
    @State private var isAddingPhoto = false
    @State private var numColumns = 3
    
    var columnsText: String {
        return "\(numColumns) columns"
    }
    
    var body: some View {
        VStack {
            if isEditing {
                Stepper(columnsText, value: $numColumns, in: 1...8, step: 1)
                    .padding()
                    .fontWeight(.bold)
            }
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: numColumns)) {
                    ForEach(dataModel.items) { item in
                        GeometryReader { geo in
                            NavigationLink(destination: IGImageDetailView(url: item.url)) {
                                IGGridItemView(size: geo.size.width, item: item)
                            }
                        }
                        .cornerRadius(8.0)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(alignment: .topTrailing) {
                            if isEditing {
                                Button {
                                    withAnimation {
                                        dataModel.removeItem(item)
                                    }
                                } label: {
                                    Image(systemName: "xmark.square.fill")
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white, .red)
                                        .font(.title)
                                }
                                .offset(x: 7, y: -7)
                            }
                        }
                    }
                }
                .padding()
            }
//            .background(.red)
        }
        .navigationBarTitle("Image Callery")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isAddingPhoto) {
            NavigationStack {
                IGPhotoPickerView()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation { isEditing.toggle() }
                } label: {
                    Text(isEditing ? "Done" : "Edit")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isAddingPhoto = true
                } label: {
                    Image(systemName: "plus")
                }
                .disabled(isEditing)
            }
        }
    }
}

struct IGGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IGGridView().environmentObject(IGDataModel())
        }
    }
}
