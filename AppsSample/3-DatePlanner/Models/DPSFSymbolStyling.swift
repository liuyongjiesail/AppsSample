//
//  DPSFSymbolStyling.swift
//  AppsSample
//
//  Created by liuyongjie on 2023/9/13.
//

import SwiftUI

struct DPSFSymbolStyling: ViewModifier {
    func body(content: Content) -> some View {
        content.imageScale(.large)
            .symbolRenderingMode(.monochrome)
    }
}

extension View {
    func sfSymbolStyling() -> some View {
        modifier(DPSFSymbolStyling())
    }
}
