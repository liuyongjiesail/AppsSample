//
//  TestContentView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/17.
//

import SwiftUI

struct TestContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section("Text And Label") {
                        Text(Date().addingTimeInterval(600), style: .date)
                        Text(Date(), style: .time)
                        Text(Date().addingTimeInterval(600), style: .relative)
                        Text(Date().addingTimeInterval(600), style: .timer)

                        Label("Your account", systemImage: "person.crop.circle")
                        Label("Text Only", systemImage: "heart")
                                .font(.title)
                                .labelStyle(TitleOnlyLabelStyle())
                        
                        Label("Icon Only", systemImage: "star")
                            .font(.title)
                            .labelStyle(IconOnlyLabelStyle())

                        Label("Both", systemImage: "paperplane")
                            .font(.title)
                            .labelStyle(TitleAndIconLabelStyle())

                        Text("This is placeholder text")
                            .font(.title)
                            .redacted(reason: .placeholder)
                        
                        HStack {
                            Text("Card number")
                                    .font(.headline)
                            Text("1234 5678 9012 3456")
                                .privacySensitive()
                                .redacted(reason: .privacy)
                        }
                    }
                    
                    Section("Image") {
                        
                    }
                }
            }
            .navigationBarTitle("Test UI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TestContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestContentView()
    }
}
