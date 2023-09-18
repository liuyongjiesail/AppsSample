//
//  LVMoodView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/18.
//

import SwiftUI

struct LVMoodView: View {
    
    @State var value: String?
    private let emojis = ["😢", "😴", "😁", "😡", "😐"]
    
    var body: some View {
        VStack {
            Text("What's your mood?")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding()
            HStack {
                ForEach(emojis, id:\.self) { emoji in
                    Button {
                        value = emoji
                    } label: {
                        VStack {
                            Text(emoji)
                                .font(.system(size: 35))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.bottom)
                            Image(systemName: value == emoji ? "circle.fill" : "circle")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .frame(minHeight: 100, maxHeight: 200)
        .background(.purple)
        .cornerRadius(15)
        .padding()
    }
}

struct LVMoodView_Previews: PreviewProvider {
    static var previews: some View {
        LVMoodView()
    }
}
