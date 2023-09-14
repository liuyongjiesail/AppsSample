//
//  SGSymbolGridView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/14.
//

import SwiftUI

struct SGSymbolGridView: View {
    
    @State private var isAddingSymbol = false
    @State private var isEditing = false
    
    private static let initialColumns = 3
    
    @State private var selectedSymbol: SGSymbol?
    @State private var numColumns = initialColumns
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    
    @State private var symbols = [
        SGSymbol(name: "tshirt"),
        SGSymbol(name: "eyes"),
        SGSymbol(name: "eyebrow"),
        SGSymbol(name: "nose"),
        SGSymbol(name: "mustache"),
        SGSymbol(name: "mouth"),
        SGSymbol(name: "eyeglasses"),
        SGSymbol(name: "facemask"),
        SGSymbol(name: "brain.head.profile"),
        SGSymbol(name: "brain"),
        SGSymbol(name: "icloud"),
        SGSymbol(name: "theatermasks.fill"),
    ]
    
    var columnsText: String {
        numColumns > 1 ? "\(numColumns) Columns" : "1 Column"
    }
    
    var body: some View {
        VStack {
            
            if isEditing {
                Stepper(columnsText, value: $numColumns, in: 1...6, step: 1) { _ in
                    withAnimation {
                        gridColumns = Array(repeating: GridItem(.flexible()), count: numColumns)
                    }
                }
                .padding()
            }
            
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(symbols) { symbol in
                        NavigationLink(destination: SGSymbolDetailView(symbol: symbol)) {
                            ZStack(alignment: .topLeading) {
                                Image(systemName: symbol.name)
                                    .resizable()
                                    .scaledToFit()
                                    .symbolRenderingMode(.hierarchical)
                                    .foregroundColor(.accentColor)
                                    .ignoresSafeArea(.container, edges: .bottom)
                                    .cornerRadius(8)
                                
                                if isEditing {
                                    Button {
                                        guard let index = symbols.firstIndex(of: symbol) else {
                                            return
                                        }
                                        withAnimation {
                                            _ = symbols.remove(at: index)
                                        }
                                    } label: {
                                        Image(systemName: "xmark.square.fill")
                                            .font(.title)
                                            .symbolRenderingMode(.palette)
                                            .foregroundStyle(.white, Color.red)
                                    }
                                    .offset(x: 7, y: -7)

                                }
                            }
                            .padding()
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(Edge.Set.top, 30)
            }
        }
        .navigationTitle("My Symbols(\(symbols.count))")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isAddingSymbol, onDismiss:addSymbol) {
            NavigationStack {
                SGSymbolPickerView(symbol: $selectedSymbol)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation {
                        isEditing.toggle()
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isAddingSymbol = true
                } label: {
                    Image(systemName: "plus")
                }
                .disabled(isEditing)
            }
        }
    }
    
    func addSymbol() {
        guard let name = selectedSymbol else {
            return
        }
        print(name.name)
        withAnimation {
            symbols.insert(name, at: 0)
            selectedSymbol = nil
        }
    }
}

struct SGSymbolGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SGSymbolGridView()
        }
    }
}
