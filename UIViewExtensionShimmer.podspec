#
# Be sure to run `pod lib lint UIViewExtensionShimmer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UIViewExtensionShimmer'
  s.version          = '0.1.2'
  s.summary          = 'A short class to add shimmer effects to any UIView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A short class to add shimmer effects to any UIView. Just call start/stopShimmer on any UIView.
                       DESC

  s.homepage         = 'https://github.com/rafaelc0sta/UIViewExtensionShimmer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rafael Costa' => 'rafael@rafaelcosta.me' }
  s.source           = { :git => 'https://github.com/rafaelc0sta/UIViewExtensionShimmer.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ObjectiveCosta'

  s.ios.deployment_target = '9.0'

  s.source_files = 'UIViewExtensionShimmer/Classes/**/*'

  s.swift_version = 5.0
  
  # s.resource_bundles = {
  #   'UIViewExtensionShimmer' => ['UIViewExtensionShimmer/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
