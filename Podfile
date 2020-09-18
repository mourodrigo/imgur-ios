platform :ios, '13.5'
use_frameworks!

supports_swift_versions '>= 5.0', '<= 5.1'

source 'https://github.com/CocoaPods/Specs.git'

# Commom Pods
def common_pods
  # Rx
  pod 'RxSwift', '5.1.0'
  pod 'RxCocoa', '5.1.0'
  pod 'RxRelay', '5.1.0'
  pod 'RxGesture', '3.0.0'
end

# Pods for the app
target 'imgur-ios' do
  common_pods

  #R
  pod 'R.swift', '5.0.3'
  pod 'R.swift.Library', '5.0.1'

  #ViewControllers
  pod 'Cartography', '4.0.0'

  #Networking
  pod 'Alamofire', '5.2'
  pod 'AlamofireImage', '4.1.0'

  end

# Pods for Tests
target 'imgur-iosTests' do
    pod 'RxTest', '5.1.0'
  common_pods
end

# Pods for UI Tests
target 'imgur-iosUITests' do
  common_pods
end
