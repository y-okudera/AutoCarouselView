//
//  ContentView.swift
//  Demo
//
//  Created by okudera on 2021/02/28.
//

import AutoCarouselView
import SwiftUI

struct ContentView: View {
    
    @State private var topCarouselCurrentPage = 0
    @State private var centerCarouselCurrentPage = 0
    @State private var bottomCarouselCurrentPage = 0
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 4) {
                    Text("Default")
                    AutoCarouselView([scaledImage(#imageLiteral(resourceName: "fox")), scaledImage(#imageLiteral(resourceName: "iceland")), scaledImage(#imageLiteral(resourceName: "tree"))], currentPage: $topCarouselCurrentPage)
                        .frame(width: UIScreen.main.bounds.width - 32, height: geometry.size.height / 4)
                    
                    Text("Interval: 3.0 Customize Page dots")
                    AutoCarouselView([scaledImage(#imageLiteral(resourceName: "fox")), scaledImage(#imageLiteral(resourceName: "iceland")), scaledImage(#imageLiteral(resourceName: "tree"))],
                                     currentPage: $centerCarouselCurrentPage,
                                     interval: 3.0,
                                     isHiddenPageDot: false,
                                     currentPageDotSize: .init(width: 10, height: 10),
                                     currentPageDotFillColor: .red,
                                     currentPageDotStrokeColor: .blue,
                                     otherPageDotSize: .init(width: 7, height: 7),
                                     otherPageDotFillColor: .gray,
                                     otherPageDotStrokeColor: .white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: geometry.size.height / 4)
                    
                    Text("Hide Page dots")
                    AutoCarouselView([scaledImage(#imageLiteral(resourceName: "fox")), scaledImage(#imageLiteral(resourceName: "iceland")), scaledImage(#imageLiteral(resourceName: "tree"))],
                                     currentPage: $bottomCarouselCurrentPage,
                                     isHiddenPageDot: true)
                        .frame(width: UIScreen.main.bounds.width - 32, height: geometry.size.height / 4)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .navigationBarTitle(Text("AutoCarousel Demo"))
        }
    }
}

extension ContentView {
    
    func scaledImage(_ image: UIImage) -> some View {
        GeometryReader { geometry in
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
