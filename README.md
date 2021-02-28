# AutoCarouselView
Auto CarouselView for SwiftUI.



## Requirements

- iOS 13.0+
- Swift 5.3+



## Installation

### Swift Package Manager

Open `Xcode`, go to `File -> Swift Packages -> Add Package Dependency` and enter `https://github.com/y-okudera/AutoCarouselView`



## Usage

- Basic

  AutoCarouselView parameters have default values.

```
import AutoCarouselView
import SwiftUI

struct ContentView: View {
    
    @State private var currentPage = 0
    
    var body: some View {
        GeometryReader { geometry in
            AutoCarouselView(
                [scaledImage(UIImage(named: "fox")!),
                 scaledImage(UIImage(named: "iceland")!),
                 scaledImage(UIImage(named: "tree")!)
                ], currentPage: $currentPage
            )
            .frame(width: UIScreen.main.bounds.width, height: geometry.size.height / 3)
        }
    }

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
```



- Customize

  You can set the appearance of the PageControl by specifying parameters in the AutoCarouselView initializer.

```
import AutoCarouselView
import SwiftUI

struct ContentView: View {
    
    @State private var currentPage = 0
    
    var body: some View {
        GeometryReader { geometry in
            AutoCarouselView(
                [scaledImage(UIImage(named: "fox")!),
                 scaledImage(UIImage(named: "iceland")!),
                 scaledImage(UIImage(named: "tree")!)],
                currentPage: $currentPage,
                interval: 3.0,
                isHiddenPageDot: false,
                currentPageDotSize: .init(width: 10, height: 10),
                currentPageDotFillColor: .red,
                currentPageDotStrokeColor: .blue,
                otherPageDotSize: .init(width: 7, height: 7),
                otherPageDotFillColor: .gray,
                otherPageDotStrokeColor: .white)
                .frame(width: UIScreen.main.bounds.width, height: geometry.size.height / 3)
        }
    }
    
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
```



## Example

See [Demo project](https://github.com/y-okudera/AutoCarouselView/blob/main/Demo).



## Maintainers

Yuki Okudera([@y-okudera](https://github.com/y-okudera)), [E-Mail](mailto:appledev.yuoku@gmail.com)



## Contributing

Feel free to dive in! [Open an issue](https://github.com/y-okudera/AutoCarouselView/issues/new) or submit PRs.



## License

AutoCarouselView is available under the MIT license. See the [LICENSE file](https://github.com/y-okudera/AutoCarouselView/blob/main/LICENSE) for more info.

