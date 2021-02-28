platform :ios, '12.0'
use_frameworks!

target 'ArcBlock-CodeTest' do
  pod 'Moya'
  pod 'SwiftyJSON'
  pod 'R.swift'
  pod 'Kingfisher', '~> 6.0'
  pod 'YYText'
  
  abstract_target 'Tests' do
#    inherit! :search_paths
    target "ArcBlock-CodeTestTests"

    pod 'Quick'
    pod 'Nimble'
  end
end
