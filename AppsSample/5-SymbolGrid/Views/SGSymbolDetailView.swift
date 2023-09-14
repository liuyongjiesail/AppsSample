//
//  SGSymbolDetailView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/14.
//

import SwiftUI

struct SGSymbolDetailView: View {
    var symbol: SGSymbol
    
    var body: some View {
        VStack {
            Text(symbol.name)
                .font(.system(.largeTitle, design: .rounded))
            
            Image(systemName: symbol.name)
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.accentColor)
            
        }
        .padding()
    }
}

struct SGSymbolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SGSymbolDetailView(symbol: SGSymbol(name: "magnifyingglass"))
    }
}
