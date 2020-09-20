# imgur-ios

This is a single view app for displaying top weekly imgur posts.

### Content and specifications
- MVVM Architecture
- ViewController -> ViewModel binding using RxSwift
- Storyboard for view designing
- Centralized SharedLocator to manage instances, allowing easy dependency injection.
- Example Unit Tests on viewmodel (also in RXSwift)
- A simple in memory image cache
- Pull to refresh on collectionview
- Compartible with iPhone/iPad
- Adaptative layout for portrait and landscape modes
- Auto retry on fail requests and error feedback
- Cell with dinamyc content type loading (image, gif, video)
- Deployment targer: iOS 13.6

### External dependencies (cocoapods)
- [RxSwift](https://github.com/ReactiveX/RxSwift)
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [AlamofireImage](https://github.com/Alamofire/AlamofireImage)

### How to run it
1. Clone the repository
2. Run "pod install" on /tmdb to install its dependencies
3. Open imgur-ios.xcworkspace
4. Enjoy!

### How does it look like

##### Main screen

![N|Solid|](https://i.ibb.co/B6nJ3Vk/Simulator-Screen-Shot-i-Phone-8-2020-09-20-at-19-00-03.png)
