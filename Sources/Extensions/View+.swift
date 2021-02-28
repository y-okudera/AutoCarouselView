//
//  View+.swift
//  AutoCarouselView
//
//  Created by okudera on 2021/02/28.
//

import SwiftUI

extension View {

    /// Dynamically hiding view.
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        if shouldHide {
            self.hidden()
        } else {
            self
        }
    }
}
