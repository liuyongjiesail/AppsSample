//
//  LVAmazingAlignmentView.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/18.
//

import SwiftUI

struct LVAmazingAlignmentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            // leading
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 40))
            Rectangle()
                .frame(width: .infinity, height: 10)
            
            // trailing
            VStack(alignment: .trailing) {
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                Rectangle()
                    .frame(width: .infinity, height: 10)
            }
            
            // maxWidth: .infinity, alignment: .trailing
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 40))
                .frame(maxWidth: .infinity, alignment: .trailing)
            Rectangle()
                .frame(width: .infinity, height: 10)
            
            // Spacer()
            HStack {
                Spacer()
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                    .background(.yellow)
                    .padding(Edge.Set.trailing, 20)
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                    .padding(.trailing, 20)
            }
            .background(.mint)
            Rectangle()
                .frame(width: .infinity, height: 10)
        }
        .padding(.horizontal)
        .frame(width: 250)
        .border(.black)
    }
}

struct LVAmazingAlignmentView_Previews: PreviewProvider {
    static var previews: some View {
        LVAmazingAlignmentView()
    }
}
