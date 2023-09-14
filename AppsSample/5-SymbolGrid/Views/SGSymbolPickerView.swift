//
//  SGSymbolPickerView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/14.
//

import SwiftUI

struct SGSymbolPickerView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var symbol: SGSymbol?
    
    let columns = Array(repeating: GridItem(), count: 4)
    let pickableSymbols = [
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
        SGSymbol(name: "house.fill"),
        SGSymbol(name: "sun.max.fill"),
        SGSymbol(name: "cloud.rain.fill"),
        SGSymbol(name: "pawprint.fill"),
        SGSymbol(name: "lungs.fill"),
        SGSymbol(name: "face.smiling"),
        SGSymbol(name: "gear"),
        SGSymbol(name: "allergens"),
        SGSymbol(name: "bolt.heart"),
        SGSymbol(name: "ladybug.fill"),
        SGSymbol(name: "bus.fill"),
        SGSymbol(name: "bicycle.circle"),
        SGSymbol(name: "faceid"),
        SGSymbol(name: "gamecontroller.fill"),
        SGSymbol(name: "timer"),
        SGSymbol(name: "eye.fill"),
        SGSymbol(name: "person.icloud"),
        SGSymbol(name: "tortoise.fill"),
        SGSymbol(name: "hare.fill"),
        SGSymbol(name: "leaf.fill"),
        SGSymbol(name: "wand.and.stars"),
        SGSymbol(name:"globe.americas.fill"),
        SGSymbol(name: "globe.europe.africa.fill"),
        SGSymbol(name: "globe.asia.australia.fill"),
        SGSymbol(name: "hands.sparkles.fill"),
        SGSymbol(name: "hand.draw.fill"),
        SGSymbol(name: "waveform.path.ecg.rectangle.fill"),
        SGSymbol(name: "gyroscope"),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(pickableSymbols) { symbol in
                    Button {
                        self.symbol = symbol
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: symbol.name)
                            .resizable()
                            .scaledToFit()
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.accentColor)
                            .ignoresSafeArea(.container, edges: .bottom)
                    }
                    .padding()
                    .buttonStyle(.plain)
                }
            }
        }
        .navigationBarTitle("Picker Symbol")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SGSymbolPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SGSymbolPickerView(symbol: Binding.constant(nil))
    }
}
