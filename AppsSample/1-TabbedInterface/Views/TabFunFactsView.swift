//
//  TabFunFactsView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/12.
//

import SwiftUI

struct TabFunFactsView: View {
    
    @State private var funFact = information.funFacts.first!
    
    var body: some View {
        VStack {
            Text("Fun Facts")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight: 400)
            
            Button("Show Random Fact") {
                funFact = information.funFacts.randomElement()!
            }
            
        }
        .padding()
    }
}

struct TabFunFactsView_Previews: PreviewProvider {
    static var previews: some View {
        TabFunFactsView()
    }
}
