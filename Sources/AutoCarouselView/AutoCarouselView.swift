//
//  AutoCarouselView.swift
//  AutoCarouselView
//
//  Created by okudera on 2021/02/28.
//

import Combine
import SwiftUI

public struct AutoCarouselView<Page: View>: View {

    // MARK: - Properties

    @Binding var currentPage: Int
    private let viewControllers: [UIHostingController<Page>]
    private let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    private let isHiddenPageDot: Bool
    private let currentPageDotSize: CGSize
    private let currentPageDotFillColor: Color
    private let currentPageDotStrokeColor: Color
    private let otherPageDotSize: CGSize
    private let otherPageDotFillColor: Color
    private let otherPageDotStrokeColor: Color

    private var numberOfPages: Int {
        viewControllers.count == 0 ? 1 : viewControllers.count
    }

    // MARK: - Initializer

    public init(_ views: [Page],
                currentPage: Binding<Int>,
                interval: TimeInterval = 2.0,
                isHiddenPageDot: Bool = false,
                currentPageDotSize: CGSize = .init(width: 5, height: 5),
                currentPageDotFillColor: Color = .blue,
                currentPageDotStrokeColor: Color = .blue,
                otherPageDotSize: CGSize = .init(width: 4, height: 4),
                otherPageDotFillColor: Color = .white,
                otherPageDotStrokeColor: Color = .gray) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self._currentPage = currentPage
        self.timer = Timer.publish(every: interval, on: .main, in: .common).autoconnect()
        self.isHiddenPageDot = isHiddenPageDot
        self.currentPageDotSize = currentPageDotSize
        self.currentPageDotFillColor = currentPageDotFillColor
        self.currentPageDotStrokeColor = currentPageDotStrokeColor
        self.otherPageDotSize = otherPageDotSize
        self.otherPageDotFillColor = otherPageDotFillColor
        self.otherPageDotStrokeColor = otherPageDotStrokeColor
    }

    public var body: some View {
        ZStack(alignment: .bottom) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
                .onReceive(timer) { _ in
                    currentPage = (currentPage + 1) % numberOfPages
                }
            makePageDots()
        }
    }
}

// MARK: - Customizing the Appearance of PageControl

private extension AutoCarouselView {

    func makePageDots() -> some View {
        HStack(spacing: 3) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                let size = pageDotSizeAt(index)
                Circle()
                    .frame(width: size.width, height: size.height)
                    .foregroundColor(pageDotFillColorAt(index))
                    .overlay(Circle().stroke(pageDotStrokeColorAt(index), lineWidth: 1))
                    .padding(.bottom, 8)
                    .animation(.spring())
            }
        }
        .hidden(isHiddenPageDot)
    }

    func pageDotSizeAt(_ index: Int) -> CGSize {
        index == currentPage ? currentPageDotSize : otherPageDotSize
    }

    func pageDotFillColorAt(_ index: Int) -> Color {
        index == currentPage ? currentPageDotFillColor : otherPageDotFillColor
    }

    func pageDotStrokeColorAt(_ index: Int) -> Color {
        index == currentPage ? currentPageDotStrokeColor : otherPageDotStrokeColor
    }
}
